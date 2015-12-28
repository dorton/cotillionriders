var CurrentPickup = React.createClass({

  getInitialState(){
    return {
      pickups: this.props.pickupProps
    }
  },

  fetchCurrentPickups(){
    var component = this;

    $.getJSON("/api/pickups.json")
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

    $.post("/api/pickup/" + pickup.id);
  },

  pickups(){
    var component = this;
    if (this.state.pickups.length === 0) {
      return <div className="mdl-layout center"><h1>Waiting for Students</h1></div>
    } else {
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
    }
  },


  render: function() {
    var component = this;


    return  <div>
      <div className="content-grid mdl-grid">
        {this.pickups()}
      </div>
    </div>
  }
});
