/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class ReviewsModel {
  String? reviewid;
  String? reviewuserid;
  String? reviewproviderid;
  String? reviewrating;
  String? reviewcomment;
  String? reviewdate;

  ReviewsModel(
      {this.reviewid,
      this.reviewuserid,
      this.reviewproviderid,
      this.reviewrating,
      this.reviewcomment,
      this.reviewdate});

  ReviewsModel.fromJson(Map<String, dynamic> json) {
    reviewid = json['review_id'];
    reviewuserid = json['review_user_id'];
    reviewproviderid = json['review_provider_id'];
    reviewrating = json['review_rating'];
    reviewcomment = json['review_comment'];
    reviewdate = json['review_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['review_id'] = reviewid;
    data['review_user_id'] = reviewuserid;
    data['review_provider_id'] = reviewproviderid;
    data['review_rating'] = reviewrating;
    data['review_comment'] = reviewcomment;
    data['review_date'] = reviewdate;
    return data;
  }
}
