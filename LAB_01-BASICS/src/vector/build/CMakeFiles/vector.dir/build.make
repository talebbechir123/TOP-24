# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.27.6/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.27.6/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/ahmedtalebbechir/desktop/COURS_UVSQ/S2/TO/TOP-24/LAB_01-BASICS/src/vector

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/ahmedtalebbechir/desktop/COURS_UVSQ/S2/TO/TOP-24/LAB_01-BASICS/src/vector/build

# Include any dependencies generated for this target.
include CMakeFiles/vector.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/vector.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/vector.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/vector.dir/flags.make

CMakeFiles/vector.dir/main.c.o: CMakeFiles/vector.dir/flags.make
CMakeFiles/vector.dir/main.c.o: /Users/ahmedtalebbechir/desktop/COURS_UVSQ/S2/TO/TOP-24/LAB_01-BASICS/src/vector/main.c
CMakeFiles/vector.dir/main.c.o: CMakeFiles/vector.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/ahmedtalebbechir/desktop/COURS_UVSQ/S2/TO/TOP-24/LAB_01-BASICS/src/vector/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/vector.dir/main.c.o"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/vector.dir/main.c.o -MF CMakeFiles/vector.dir/main.c.o.d -o CMakeFiles/vector.dir/main.c.o -c /Users/ahmedtalebbechir/desktop/COURS_UVSQ/S2/TO/TOP-24/LAB_01-BASICS/src/vector/main.c

CMakeFiles/vector.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/vector.dir/main.c.i"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/ahmedtalebbechir/desktop/COURS_UVSQ/S2/TO/TOP-24/LAB_01-BASICS/src/vector/main.c > CMakeFiles/vector.dir/main.c.i

CMakeFiles/vector.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/vector.dir/main.c.s"
	/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/ahmedtalebbechir/desktop/COURS_UVSQ/S2/TO/TOP-24/LAB_01-BASICS/src/vector/main.c -o CMakeFiles/vector.dir/main.c.s

# Object files for target vector
vector_OBJECTS = \
"CMakeFiles/vector.dir/main.c.o"

# External object files for target vector
vector_EXTERNAL_OBJECTS =

/Users/ahmedtalebbechir/desktop/COURS_UVSQ/S2/TO/TOP-24/LAB_01-BASICS/src/vector/bin/vector: CMakeFiles/vector.dir/main.c.o
/Users/ahmedtalebbechir/desktop/COURS_UVSQ/S2/TO/TOP-24/LAB_01-BASICS/src/vector/bin/vector: CMakeFiles/vector.dir/build.make
/Users/ahmedtalebbechir/desktop/COURS_UVSQ/S2/TO/TOP-24/LAB_01-BASICS/src/vector/bin/vector: liblibcompute.a
/Users/ahmedtalebbechir/desktop/COURS_UVSQ/S2/TO/TOP-24/LAB_01-BASICS/src/vector/bin/vector: liblibvector.a
/Users/ahmedtalebbechir/desktop/COURS_UVSQ/S2/TO/TOP-24/LAB_01-BASICS/src/vector/bin/vector: CMakeFiles/vector.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/ahmedtalebbechir/desktop/COURS_UVSQ/S2/TO/TOP-24/LAB_01-BASICS/src/vector/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable /Users/ahmedtalebbechir/desktop/COURS_UVSQ/S2/TO/TOP-24/LAB_01-BASICS/src/vector/bin/vector"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/vector.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/vector.dir/build: /Users/ahmedtalebbechir/desktop/COURS_UVSQ/S2/TO/TOP-24/LAB_01-BASICS/src/vector/bin/vector
.PHONY : CMakeFiles/vector.dir/build

CMakeFiles/vector.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/vector.dir/cmake_clean.cmake
.PHONY : CMakeFiles/vector.dir/clean

CMakeFiles/vector.dir/depend:
	cd /Users/ahmedtalebbechir/desktop/COURS_UVSQ/S2/TO/TOP-24/LAB_01-BASICS/src/vector/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/ahmedtalebbechir/desktop/COURS_UVSQ/S2/TO/TOP-24/LAB_01-BASICS/src/vector /Users/ahmedtalebbechir/desktop/COURS_UVSQ/S2/TO/TOP-24/LAB_01-BASICS/src/vector /Users/ahmedtalebbechir/desktop/COURS_UVSQ/S2/TO/TOP-24/LAB_01-BASICS/src/vector/build /Users/ahmedtalebbechir/desktop/COURS_UVSQ/S2/TO/TOP-24/LAB_01-BASICS/src/vector/build /Users/ahmedtalebbechir/desktop/COURS_UVSQ/S2/TO/TOP-24/LAB_01-BASICS/src/vector/build/CMakeFiles/vector.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/vector.dir/depend

