cmake_minimum_required(VERSION 3.5)

project(wvs_interfaces)

# Default to C++17
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 17)
  set(CMAKE_CXX_STANDARD_REQUIRED ON)
endif()
if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(geographic_msgs REQUIRED)

set(ptu_files
    "msg/AbsolutePTUattitude.msg"
    "msg/LocationPTUattitude.msg"
    "msg/RelativePTUattitude.msg"
    "msg/IncrementialPTUattitude.msg"
    "msg/PTUPose.msg"
    "action/PtuAimCommand.action"
    "action/ObserveAreaCommand.action"
    "action/TrackDetectionCommand.action"
)

set(bda_cde_files
    "msg/BattleDamage.msg"
    "msg/DamageStatus.msg"
    "msg/DetectedObject.msg"
    "msg/Detection.msg"
    "msg/FiringSolution.msg"
    "msg/SignatureElement.msg"
	  "srv/BDAService.srv"
    "srv/CDEService.srv"
    "srv/CoverLocationService.srv"
    "srv/ObservationLocationService.srv"
    "msg/Locations.msg"
)

set(misc_files
    "msg/CameraFOVCommand.msg"
    "msg/CameraStatus.msg"
    "msg/SpottingReport.msg"
    "msg/RobotControlState.msg"
)

set(weapon_files
    "srv/LoadService.srv"
    "srv/ArmService.srv"
    "action/FireCommand.action"
    "srv/UnloadService.srv"
    "msg/WeaponState.msg"
    "msg/AmmunitionState.msg"
)

set (nav_waypoint_follower_files
    "action/Navigate.action"
    "srv/NavigationEnable.srv"
)

rosidl_generate_interfaces(${PROJECT_NAME}
  ${ptu_files}
  ${bda_cde_files}
  ${misc_files}
  ${weapon_files}
  ${nav_waypoint_follower_files}
  DEPENDENCIES geographic_msgs
  ADD_LINTER_TESTS
)

ament_export_dependencies(rosidl_default_runtime)

ament_package()