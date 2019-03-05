var config = {
    apiKey: "AIzaSyCbkg9nS6cdOVts9K31g1kZetxElL3I5_w",
    authDomain: "sharetone-bb500.firebaseapp.com",
    databaseURL: "https://sharetone-bb500.firebaseio.com",
    projectId: "sharetone-bb500",
    storageBucket: "sharetone-bb500.appspot.com",
    messagingSenderId: "1098540854946"
};
firebase.initializeApp(config);

var provider = new firebase.auth.GoogleAuthProvider();
var db = firebase.database();
location.href='login.html'


function re() {
    var id = document.getElementById("id");
    var ps = document.getElementsByName("ps");
    var ps1 = document.getElementsByName("ps1");
    var name = document.getElementsByName("name");
    if (ps != ps1) {
        alert("비밀번호를 확인해주세요");
        return;
    }
    db.ref.child('users').orderByChild('id').equalTo(id).on("value", function (snapshot) {
        console.log(snapshot.val());
        snapshot.forEach(function (data) {
            console.log(data.key);
        });
    });


    //ac.push({ 'mail': id, 'name': name, 'ps': ps });
}