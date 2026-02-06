import React from "react";
import "./lockin.css";

export default function LockInPanel({
  range = "10:30-11:00",
  countdown = "10:46",
  task = "texture shotgun shells",
  isLocked = false,
  elapsed = "5m 12s",
  onToggle
}) {
  return (
    <div className="lockin-card">
      <div className="lockin-range">{range}</div>

      <div className="lockin-row">
        <div className="lockin-left">
          <div className="lockin-time">{countdown}</div>
          <div className="lockin-sub">UNTIL NEXT TASK</div>
        </div>

        <button
          className={`lockin-cta ${isLocked ? "is-locked" : "is-unlocked"}`}
          type="button"
          onClick={onToggle}
        >
          <span className="lockin-cta-text">{isLocked ? "LOCKED IN" : "LOCK IN"}</span>
          {isLocked ? <span className="lockin-cta-sub">{elapsed}</span> : null}
        </button>
      </div>

      <div className="lockin-task">Task: {task || "—"}</div>
    </div>
  );
}
