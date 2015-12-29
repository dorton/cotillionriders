var MarkAsPickup = React.createClass({

    getInitialState(){
      return {
        pickups: []
      }
    },

    fetchCurrentPickups(){
      let searchQuery = this.refs.search.getDOMNode().value;

      var component = this;

      $.getJSON("/api/setpickups.json?q=" + searchQuery)
        .done(function(json){

          component.setState({ pickups: json.pickups });
        })
    },

    componentDidMount(){
      this.fetchCurrentPickups();
      this.currentpickupInterval = setInterval(this.fetchCurrentPickups, 1500);
    },

    componentWillUnmount(){
      clearInterval(currentpickupInterval);
    },

    pickupStudentHandeler(pickup){
      // alert("clicked: " + pickup.student_name);

      var node = this.refs["pickup-" + pickup.id].getDOMNode();
      $(node).hide("slow");

      $.post("/api/setpickups/" + pickup.id);

      document.getElementById("search").value = '';


    },

    pickups(){
      var component = this;

        return this.state.pickups.map(function(current_pickup){
          let pickupStudent = component.pickupStudentHandeler.bind(component, current_pickup)
          return <div ref={"pickup-" + current_pickup.id} key={current_pickup.id} className="pickup mdl-card mdl-cell mdl-cell--2-col mdl-cell--2-col-tablet mdl-shadow--4dp" onClick={pickupStudent}>
            <div className="mdl-card__media">
              <img src={current_pickup.pic}></img>
            </div>
            <div className="mdl-card__title">
              <div className="mdl-card__title-text">{current_pickup.student_name}</div>
            </div>
          </div>
        })

    },

  handleChange() {
      this.props.onUserInput(
          // this.refs.filterTextInput.value,
      );
  },


    render: function() {
      var component = this;
      return  <div>
        <div className="mdl-textfield mdl-js-textfield mdl-textfield--floating-label content-grid mdl-grid">
          <input type="text" ref="search" className="mdl-textfield__input search" placeholder="Search..." id="search"></input>
        </div>

        <div className="content-grid mdl-grid">
          {this.pickups()}
        </div>
      </div>
    }
  });
