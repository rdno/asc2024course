# Removes unncessary files from a SPECFEM2D repository cloned from GitHub to
# save storage space. Particularly used for reducing space requirements of 
# a Docker Image.

# Tested w/ commit baeb71d on 5/14/2024
# this MUST be run inside a SPECFEM2D repository
# Reduces storage size to <100Mb

# MAIN DIRECTORY
rm -rf obj
rm -rf doc
rm -rf external_libs
rm -rf .git


# EXAMPLES (keep a few: Tape2007, Tromp2005, fluid_solid, global_Earth_ak135f,
#   moving_sources_acoustic, simple_topography_and_also_a_simple_fluid_layer)
rm -rf EXAMPLES/BENCHIE_water_PVC
rm -rf EXAMPLES/BENCHMARK_CLAERBOUT_ADJOINT
rm -rf EXAMPLES/Gmsh_example_Stacey_MPI
rm -rf EXAMPLES/Industrial_Format_SEP
rm -rf EXAMPLES/LuoYang_fluid_solid_kernel
rm -rf EXAMPLES/Marmousi2_to_be_done_one_day_not_ready_yet
rm -rf EXAMPLES/Marmousi_mesh_of_the_model
rm -rf EXAMPLES/README_EXAMPLES
rm -rf EXAMPLES/Rayleigh_wave_no_crack
rm -rf EXAMPLES/Rayleigh_wave_no_crack_simpler_way_to_generate_the_wave
rm -rf EXAMPLES/Rayleigh_wave_with_crack
rm -rf EXAMPLES/ZZZ_older_files_could_be_useful_one_day_please_do_not_remove
rm -rf EXAMPLES/anisotropic_isotropic_model
rm -rf EXAMPLES/anisotropic_zinc_crystal
rm -rf EXAMPLES/attenuation
rm -rf EXAMPLES/axisymmetric_case_AXISYM_option
rm -rf EXAMPLES/canyon
rm -rf EXAMPLES/change_something_in_all_the_Par_files_automatically.bash
rm -rf EXAMPLES/check_absolute_amplitude_of_force_source_seismograms_elastic
rm -rf EXAMPLES/check_absolute_amplitude_of_force_source_seismograms_viscoelastic
rm -rf EXAMPLES/check_absolute_amplitude_of_pressure_source_seismograms_acoustic
rm -rf EXAMPLES/infinite_homogeneous_moment_tensor_vertical_dip_slip
rm -rf EXAMPLES/infinite_homogeneous_plane_wave
rm -rf EXAMPLES/initial_mode_LDDRK
rm -rf EXAMPLES/initial_plane_wave_with_free_surface
rm -rf EXAMPLES/noise_uniform
rm -rf EXAMPLES/paper_axisymmetry_example
rm -rf EXAMPLES/perfect_idealized_oceanic_guide_in_underwater_acoustics
rm -rf EXAMPLES/poroelastic_acoustic
rm -rf EXAMPLES/poroelastic_semi_infinite_homogeneous
rm -rf EXAMPLES/process_DATA_Par_files_to_update_their_format_when_new_parameters_are_added.py
rm -rf EXAMPLES/process_DATA_Par_files_to_update_their_parameters_from_a_main_file.py
rm -rf EXAMPLES/salt_dome_CUBIT_mesh_from_Ronan_Madec
rm -rf EXAMPLES/salt_dome_Vadim
rm -rf EXAMPLES/semi_infinite_homogeneous
rm -rf EXAMPLES/thermocline
rm -rf EXAMPLES/tomographic_ocean_model
rm -rf EXAMPLES/unresolved_bugs
rm -rf EXAMPLES/view_all_parameter_files_to_modify_them.bash

# EXAMPLE REF SUBDIR
rm -rf EXAMPLES/simple_topography_and_also_a_simple_fluid_layer/REF_KERNEL
rm -rf EXAMPLES/fluid_solid/fluid_solid_external_mesh/REF_SEIS

