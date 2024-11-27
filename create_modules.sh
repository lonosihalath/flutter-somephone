# Check if the project name is provided
# Arrow Path chmod +x create_modules.sh
if [ -z "$1" ]; then
  echo "Usage: $0 Please enter your modules < create_modules.sh your-modules-name >"
  exit 1
fi

if [ -d "lib/app/modules/root/$1" ]; then
  echo "Error: modules <$1> directory already exists."
  exit 1
fi

# Capitalize the first letter of the modules name
modulesName=$(echo "$1" | awk '{print toupper(substr($0, 1, 1)) tolower(substr($0, 2))}')

first_char=$(echo "$1" | cut -c1 | tr '[:lower:]' '[:upper:]')

rest_of_string=$(echo "$1" | cut -c2-)

capitalized_text="${first_char}${rest_of_string}"

lowercase_text=$(echo "$1" | tr '[:upper:]' '[:lower:]')

get create page:$1 on root


Create directories
mkdir -p lib/app/repository/$1
mkdir -p lib/app/services
mkdir -p lib/app/state


cat >> lib/app/repository/$1/$1_Repo.dart <<END
abstract class  ${capitalized_text}Repo {
  Future<String> getTodo();
}
END

cat >> lib/app/repository/$1/$1_Imp.dart <<END

class  ${capitalized_text}Imp extends ${capitalized_text}Repo {
   ${capitalized_text}Imp();

  @override
  Future<String> getTodo() {
    // TODO: implement getTodo
    throw UnimplementedError();
  }
}
END

cat >> lib/app/services/$1_services.dart <<END
import 'package:get/get.dart';
class ${capitalized_text}Services extends GetxService {
  late ${capitalized_text}Repo ${lowercase_text}Repo;
  late ${capitalized_text}State ${lowercase_text}State;

  ${capitalized_text}Services() {
    ${lowercase_text}Repo = Get.put(${capitalized_text}Imp());
    ${lowercase_text}State = Get.put(${capitalized_text}State());
  }
}
END

cat >> lib/app/state/$1_state.dart <<END
import 'package:get/get.dart';
class ${capitalized_text}State extends GetXState {
}
END


flutter pub get

echo "Clean Architecture folder structure created successfully!"
