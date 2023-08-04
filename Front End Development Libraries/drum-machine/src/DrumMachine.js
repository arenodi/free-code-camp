import { useState, useEffect } from "react";

const AudioButton = ({ refKey, urlAudio, audioName, playFunc }) => {
  return (
    <button
      id={audioName}
      className="drum-pad"
      onClick={() => playFunc(String(refKey).toUpperCase())}
    >
      <p>{refKey}</p>
      <audio
        id={refKey}
        className="clip"
        src={urlAudio}
        preload="auto"
        type="audio/mpeg"
      ></audio>
    </button>
  );
};

const KeyBoard = ({ listOfAudio, playFunc }) => {
  let generatedKeyBoard = listOfAudio.map((audio) => {
    return (
      <div className="button-div">
        <AudioButton
          refKey={audio.keyPress}
          urlAudio={audio.src}
          audioName={audio.name}
          playFunc={playFunc}
        />
      </div>
    );
  });

  return (
    <div id="keyboard" className="keyboard">
      {generatedKeyBoard}
    </div>
  );
};

const Display = ({ listOfAudio, playedPad }) => {
  let audioName = listOfAudio
    .filter((audio) => (audio.keyPress === playedPad ? audio : ""))
    .map((audio) => audio.name);
  return (
    <div id="display" className="display">
      <div className="display-screen">{audioName}</div>
    </div>
  );
};

const DrumApp = ({ audioInfo, possibleKeys }) => {
  const [downKey, setDownKey] = useState("");

  const handlePlay = (pressedKey) => {
    document.getElementById(pressedKey).play();
    setDownKey(pressedKey);
  };

  const handlePressedKey = (key) => {
    let pressedKey = String(key).toUpperCase();
    if (possibleKeys.indexOf(pressedKey) !== -1) {
      handlePlay(pressedKey);
    }
  };

  useEffect(() => {
    document.addEventListener("keydown", (e) => handlePressedKey(e.key));
    return document.removeEventListener("keydown", (e) =>
      handlePressedKey(e.key)
    );
  });

  return (
    <div id="drum-machine" className="drum-machine">
      <div className="display-section">
        <div className="logo">Drum-Machine</div>
        <Display listOfAudio={audioInfo} playedPad={downKey} />
      </div>
      <KeyBoard listOfAudio={audioInfo} playFunc={handlePlay} />
    </div>
  );
};

export default DrumApp;
