import React from "react";
import Workout from "./Workout";

function Workouts(props) {
  console.log(props);
  console.log(props.workouts);
  return (
    <div className="workouts">
      <ul>
        {props.workouts.map((item) => (
          <Workout />
        ))}
      </ul>
    </div>
  );
}

export default Workouts;
