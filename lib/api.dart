const webApi = {'domain': 'http://192.168.0.101:3000'};
//

// const webApi = {'domain': 'http://10.0.2.2:3000'}; //EMU connection

const endPoints = {
  'register': '/api/user/register',
  'loginuser': '/api/user/loginuser',
  'fetchStudents': '/api/user/fetchStudents',

  //appConfig

  'insertAppConfig': '/api/appConfig/insertAppConfig',

  'fetchAppConfig': '/api/appConfig/fetchAppConfig',

  'fetchCommonAppConfig': '/api/appConfig/fetchCommonAppConfig',

  //Events

  'createEvent': '/api/event/createEvent',
  'fetchEvents': '/api/event/fetchEvents',

  'fetchAcadmics': '/api/acadmic/fetchAcadmics',

  //

  'fetchNotifications': '/api/event/fetchNotifications',

  'markAsSeen': '/api/event/markAsSeen'
};
