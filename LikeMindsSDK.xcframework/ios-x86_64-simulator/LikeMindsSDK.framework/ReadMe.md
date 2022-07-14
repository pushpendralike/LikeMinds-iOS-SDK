
VIPER Architecture Commands

Install Generamba

$ sudo gem install generamba

$ generamba setup
```
The author name which will be used in the headers: Likeminds
The company name which will be used in the headers: Likeminds
The name of your project is Collabmates-ios. Do you want to use it? (yes/no) yes
The project prefix (if any):
The path to a .xcodeproj file of the project is 'CollabMates.xcodeproj'. Do you want to use it? (yes/no) yes
Select the appropriate target for adding your MODULES (type the index):
0. CollabMates
1. CollabMatesTests
2. CollabMatesServiceExtension
3. CollabMatesContentExtension
4. CollabMatesShareExtension
 CollabMates
Are you using unit-tests in this project? (yes/no) no
Do you want to add all your modules by one path? (yes/no) yes
Do you want to use the same paths for your files both in Xcode and the filesystem? (yes/no) yes
The default path for creating new modules: n
Are you using Cocoapods? (yes/no) yes
The path to a Podfile is 'Podfile'. Do you want to use it? (yes/no) yes
Are you using Carthage? (yes/no) no
Do you want to add some well known templates to the Rambafile? (yes/no) yes
```

// generamba gen MODULE_NAME likeminds_viper

// for custom path
// generamba gen CreateChatRoom likeminds_viper --project_file_path 'CollabMates/LikeMinds/Modules/CreateChatRoomModules' --project_group_path 'CollabMates/LikeMinds/Modules/CreateChatRoomModules'
