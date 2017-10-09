load_system('InertialSimulink');
replace_block('InertialSimulink', 'Step', 'Sin', 'noprompt');
set_param('InertialSimulink/Reference', 'Amplitude', '2');
set_param('InertialSimulink/Reference', 'Frequency', '10');

replace_block('InertialSimulink', 'Sin', 'Step', 'noprompt');