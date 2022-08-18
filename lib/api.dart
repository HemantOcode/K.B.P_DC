// const webApi = {'domain': 'http://192.168.0.110:3000'};
// const webApi = {'domain': 'https://kbpcollege.herokuapp.com'};

//

const webApi = {'domain': 'http://10.0.2.2:3000'}; //EMU connection

const endPoints = {
  'register': '/api/user/register',
  'loginuser': '/api/user/loginuser',
  'fetchStudents': '/api/user/fetchStudents',

//Forget Passwords

  'getUserEmailORPhone': '/api/user/getUserEmailORPhone',
  'changeUserPassWord': '/api/user/changeUserPassWord',

  //appConfig

  'insertAppConfig': '/api/appConfig/insertAppConfig',
  
  'fetchAppConfig': '/api/appConfig/fetchAppConfig',

  'fetchCommonAppConfig': '/api/appConfig/fetchCommonAppConfig',

  //Events

  'createEvent': '/api/event/createEvent',
  'fetchEvents': '/api/event/fetchEvents',

  'fetchAcadmics': '/api/acadmic/fetchAcadmics',

  //

  'fetchNotifications': '/api/notification/fetchNotifications',

  'markAsSeen': '/api/notification/markAsSeen'
};
