import codegenNativeComponent from "react-native/Libraries/Utilities/codegenNativeComponent";
import type {
  Int32,
  DirectEventHandler,
} from "react-native/Libraries/Types/CodegenTypes";
import type { ViewProps } from "react-native";

type BlankAreaEvent = Readonly<{
  width: Int32;
  height: Int32;
}>;

interface NativeProps extends ViewProps {
  index?: Int32;
  onBoundsChange?: DirectEventHandler<BlankAreaEvent>;
}

export default codegenNativeComponent<NativeProps>("CellContainer");
