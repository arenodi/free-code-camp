import DrumApp from "./DrumMachine";
import audioFile from "./resources/audioInfo";
import possibleKeyPress from "./resources/possibleKeys";

function App() {
  return <DrumApp audioInfo={audioFile} possibleKeys={possibleKeyPress} />;
}

export default App;
