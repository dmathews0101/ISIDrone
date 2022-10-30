$(function(){
  var drone = [
    { value: 'DJI Phantom 2 Vision', data: '0' },
    { value: 'Tera Mini Quadrocoptère', data: '1' },
    { value: 'Parrot AR.Drone 2.0 Elite', data: '2' },
    { value: 'BlueBeach Mini Quadcopter', data: '3' },
    { value: 'XT-XINTE Hubsan X4', data: '4' },
    { value: 'Hélicoptère RC Syma', data: '5' },
    { value: 'Hélices Hubsan X4', data: '6' },
    { value: 'HUBSAN X4 H107C Mini', data: '7' },
    { value: 'JJRC H12C-5', data: '8' },
    { value: 'EiioX Mini RC Quadcopter', data: '9' },
    { value: 'XT-XINTE Walkera TALI', data: '10' },
    { value: 'Parrot PF070105 Hélice', data: '11' },
    { value: 'BlueBeach JJRC', data: '12' },
    { value: 'Hubsan X4 V2 H107L', data: '13' },
    { value: 'Drone robot NOIR', data: '14' },
    { value: 'Revell Control - 23987', data: '15' },
    { value: '3D Robotics Iris+', data: '16' },
    { value: 'Akku-King Batterie', data: '17' },
  ];
  
  $('#autocomplete').autocomplete({
    lookup: drone,
    onSelect: function (suggestion) {
    	window.location.replace("item?item=" + suggestion.data);
    }
  });
  

});