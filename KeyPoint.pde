// https://www.tensorflow.org/lite/examples/pose_estimation/overview

class KeyPoint {
  
  PVector position;
  int id;
  String name;
  
  KeyPoint(int _id, float _x, float _y) {
    position = new PVector(_x, _y);
    id = _id;
    setName(id);
  }
  
  void setName(int _id) {
    switch(_id) {
      case 0:
        name = "nose";
        break;
      case 1:
        name = "leftEye";
        break;
      case 2:
        name = "rightEye";
        break;
      case 3:
        name = "leftEar";
        break;
      case 4:
        name = "rightEar";
        break;
      case 5:
        name = "leftShoulder";
        break;
      case 6:
        name = "rightShoulder";
        break;
      case 7:
        name = "leftElbow";
        break;
      case 8:
        name = "rightElbow";
        break;
      case 9:
        name = "leftWrist";
        break;
      case 10:
        name = "rightWrist";
        break;
      case 11:
        name = "leftHip";
        break;
      case 12:
        name = "rightHip";
        break;
      case 13:
        name = "leftKnee";
        break;
      case 14:
        name = "rightKnee";
        break;
      case 15:
        name = "leftAnkle";
        break;
      case 16:
        name = "rightAnkle";
        break;
      default:
        name = "bone";
        break;
    }
  }
  
}
