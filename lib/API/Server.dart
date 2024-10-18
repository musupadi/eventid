String BaseURL(){
  return "https://buatevent.id/";
}
String APIBaseURL(){
  return BaseURL()+"api/";
}
String ImageBaseURL(){
  return BaseURL()+"img/post/";
}
String ProfileImageBaseURL(){
  return BaseURL()+"img/profile/";
}
String BaseFileURL(){
  return BaseURL()+"report/";
}
var headers = {
  'Content-type': 'application/json',
  "Accept": "application/json",
  "Access-Control-Allow-Origin": APIBaseURL(),
  "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
  "Access-Control-Allow-Headers": " Origin, Content-Type, Accept, Authorization, X-Request-With",
};
Map<String,String> headerBuilder(String token) {
  return headers = {
    'Content-type': 'application/json',
    "Accept": "application/json",
    "Access-Control-Allow-Origin": APIBaseURL(),
    "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
    "Access-Control-Allow-Headers": " Origin, Content-Type, Accept, Authorization, X-Request-With",
    "token": token
  };
}

// NLP
String APIHotelNLP(){
  return "Nlp/HotelNLP";
}



String APILogin(){
  return "Authorization/login";
}
String APILoginGoogle(){
  return "Authorization/google";
}
String APIRegister(){
  return "Authorization/register";
}
String APIProfile(String id_user){
  return "Profile?id=$id_user";
}
String APISearchPerson(){
  return "Profile/search";
}
String APIChangeUsername(){
  return "Authorization/changeusername";
}
String APINewPost(){
  return "Post/newpost";
}
String APIFollowData(){
  return "Profile/follow";
}

String APIPost(String id_user){
  return "Post?id_user=$id_user";
}
String APISearchPost(String id_post,String id_category){
  return "Post/detail?id_post=$id_post&id_category=$id_category";
}
String APIPostLikes(String id_user){
  return "Post/likespost?id_user=$id_user";
}
String APIPostUser(String id_user){
  return "Post/userpost?id_user=$id_user";
}
String APISearchImg(){
  return "Post/searchimg";
}
String APIImage(String id_user){
  return "Post/image?id_user=$id_user";
}
String APINotificationGet(String id_user){
  return "Profile/notification?id_user=$id_user";
}

String APINotificationPost(){
  return "Profile/notification";
}
String APIChangeFoto(){
  return "Profile/changephoto";
}

// Likes Posting
String APICheckFollow(){
  return "Profile/checkfollow";
}
String APILikes(){
  return "Post/likepost";
}
String APIFollowings(){
  return "Profile/following";
}
String APIGetLikes(String id_user,String id_post){
  return "Post/likes?id_user=$id_user&id_post=$id_post";
}
String APIGetLikesCount(String id_post){
  return "Post/countlikes?id_post=$id_post";
}

//Comment
String APIGetComment(String id_post){
  return "Post/comments?id_post=$id_post";
}
String APIPostComment(){
  return "Post/insertcomment";
}
String APIPostSubComment(){
  return "Post/insertsubcomment";
}