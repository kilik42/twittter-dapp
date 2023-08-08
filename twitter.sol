pragma solidity ^0.8.0;

contract Twitter {
    mapping(address => string) public tweets;
    mapping(address => uint) public tweetCount;
    mapping(address => uint) public followerCount;
    mapping(address => uint) public followingCount;

    function createTweet(string memory _tweet) public {
        require(bytes(_tweet).length > 0);
        tweets[msg.sender] = _tweet;
        tweetCount[msg.sender]++;
    }
    function getTweet(address _owner) public view returns (string memory) {
        return tweets[_owner];
    }

    function follow(address _followed) public {
        require(_followed != msg.sender);
        followingCount[msg.sender]++;
        followerCount[_followed]++;
    }

    function unfollow(address _followed) public {
        require(_followed != msg.sender);
        require(followingCount[msg.sender] > 0);
        require(followerCount[_followed] > 0);
        followingCount[msg.sender]--;
        followerCount[_followed]--;
    }

}