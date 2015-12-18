/*
* HOW TO USE:
*   Create DBE to return tag group called "Tag Group EMEA":
*       bt_cookie("BTgroupEMEA")
*
*   Create conditional firing rule:
*       [[EMEA: Tag Group]] == "Turn"
*       [[EMEA: Tag Group]] == "BAU"
*/

(function (group) {
  if (group == "") {
    var groups = ["Turn", "BAU"],
        rnd = BrightTag.Random.integer() % groups.length,
        date = new Date();
        date.setTime(date.getTime()+(365*86400000));
    var expires = date.toGMTString();
        
        document.cookie = "BTgroupEMEA=" + groups[rnd] + ";path=/;expires=" + expires;
  }
}(bt_cookie("BTgroupEMEA")))