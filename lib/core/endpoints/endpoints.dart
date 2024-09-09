class ApiEndpoints {
  static const String baseUrl = 'http://192.168.1.52:3000/api/v1';
  // static const String baseUrl = 'http://122.165.225.9:3000/api/v1';
  // static const String baseUrl = 'https://raksports.com/api/v1';
  // static const String baseUrl = 'http://34.143.144.220:3000/api/v1';
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String register = '/users';
  static const String getRoles = '/lookup';
  static const String coachprofile = '/coach/';
  static const String orientation = '/coach/';
  static const String oriURL = '/orientation';
  static const String playerprofile = '/player/';
  static const String getcoach = '/coach';
  static const String getplayer = '/player';
  static const String getDrills = '/lookup/drills';
  static const String getMatchType = '/lookup/matchType';

  String reqDetails(String userId) {
    return '$oriURL/$userId';
  }

  String getProfileImagePath(String userId) {
    return '$baseUrl/users/$userId/profileImage';
  }

  static const String faqVerify = '/users/verifyRAQCode';

  // String putcoachprofile(String userId) {
  //   return '/users/$userId';
  // }

  String coachProfileURL(int coachId) {
    return '/coach/$coachId';
  }

  String userProfileUpdateURL(int userId) {
    return '/users/$userId';
  }

  String userProfileGetURL(int userId) {
    return '/users/$userId';
  }

  String getPlayerById(int userId) {
    return '/$getplayer/$userId';
  }

  String playerRequest(String status) {
    return '$oriURL?status=$status';
  }

  String coachPlayerRequest(String status, String coachId) {
    return '/coach/$coachId/playrReq?status=$status';
  }

  String getAvailableCoaches(int id, int playerId) {
    return '/orientation/$id/getCoach/$playerId';
  }

  String patchAvailableCoaches(int id, int playerId) {
    return '/orientation/$id/getCoach/$playerId';
  }

  String putplayerprofile(int userId) {
    return '/player/$userId';
  }

  String getuploadCerticates(String userId) {
    return '$baseUrl/coach/$userId/certificates';
  }

  String createTeam(String userId) {
    return '/coach/$userId/team';
  }

  String assigncoach(String academyId, int teamId) {
    return '/coach/$academyId/team/$teamId';
  }

  String deletecoach(String academyId, int teamId) {
    return '/coach/$academyId/team/$teamId';
  }

  String assignplayer(String academyId, int teamId) {
    return '/player/$academyId/team/$teamId';
  }

  String deleteplayer(String academyId, int teamId) {
    return '/player/$academyId/team/$teamId';
  }

//=============================TRIALS=============================//

  String getTrials({required String userId}) {
    return '/coach/$userId/trials';
  }

  String trialSchedule({required String userId}) {
    return '/coach/$userId/trials';
  }

  String patchCompleteTrail({required String userId, required int trialId}) {
    return '/coach/$userId/trials/$trialId';
  }

  String getteambycoachid(String academyId) {
    return '/coach/$academyId/teamList';
  }

  String attendanceMarking({required String userId}) {
    return '/coach/$userId/attendance';
  }

  String getteaminfo(String academyId) {
    return '/coach/$academyId/teamInfo';
  }

  String getCurriculumById(String academyId) {
    return '/player/$academyId/curriculum';
  }

  String getCurriculumShedule(String academyId, int curriculumId) {
    return '/player/$academyId/curriculum/$curriculumId/schedule';
  }

  String getCurriculum(String academyId, int curriculumId, int sheduleId) {
    return '/player/$academyId/curriculum/$curriculumId/schedule/$sheduleId';
  }

  String createWellness(
    String academyId,
  ) {
    return '/player/$academyId/wellness';
  }

  String getWellness(
    String academyId,
  ) {
    return '/player/$academyId/welnessScore';
  }

  String createSkillAssesment(
    String academyId,
  ) {
    return '/coach/$academyId/skillAssessment';
  }

//======================CURRICULUM=============================//

  String createCurriculum(String userId) {
    return '/coach/$userId/curriculum';
  }

  String getCurriculumList(String coachId, String playerId) {
    return '/coach/$coachId/curriculum/$playerId';
  }

  String getCurriculumSchedule(String coachId, String playerId) {
    return '/coach/$coachId/curriculum/$playerId/schedule';
  }

  String curriculumResult(String coachId, String curriculumId, String scheduleId) {
    return '/coach/$coachId/curriculum/$curriculumId/schedule/$scheduleId';
  }

//===========================SKILL ASSESSMENT===============================//

  String getSkillAssessmentList(String academyId, int playerId) {
    return '/coach/$academyId/skillAssessment/$playerId';
  }

  String getSkillAssessmentView(String academyId, int playerId, int listId) {
    return '/coach/$academyId/skillAssessment/$playerId/$listId';
  }

  String getMonthlyWellness(String playerId) {
    return '/player/$playerId/wellness?type=All&filterKey=month&fromDate=&toDate=';
  }

  String getCustomDateWellness(String playerId, String fromDate, String toDate) {
    return '/player/$playerId/wellness?type=All&filterKey=customDate&fromDate=$fromDate&toDate=$toDate';
  }

  String getCalendarEvent(String academyId, String date) {
    return '/event/$academyId?date=$date';
  }

//=======================NOTIFICATION==========================//

  String getNotification(String userId) {
    return '/notification?userId=$userId&isFav=N';
  }

  String patchNotification(String academyId, String id) {
    return '/notification/$academyId/$id';
  }

//======================MATCH/EVENT==========================//

  String createMatch(String academyId, String playerId) {
    return '/coach/$academyId/player/$playerId/match';
  }

  String getMatchList(String academyId, String playerId) {
    return '/coach/$academyId/player/$playerId/match';
  }

  String getMatchListById(String academyId, String matchId) {
    return '/coach/$academyId/match/$matchId';
  } // also for update and delete

  String getKnowledgevalut() {
    return '/library/topic';
  }

  String getKnowledgevalutview(int vaultId) {
    return '/library/topic/$vaultId/chapters';
  }

  String getEventtype() {
    return '/lookup/eventType';
  }

  String getListofTeamMembers(int academyId, int teamId) {
    return '/coach/$academyId/teamUser/$teamId';
  }
}
