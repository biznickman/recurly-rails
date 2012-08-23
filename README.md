**Recurly Rails**

I went searching for some sample rails integrations with Rails and couldn't find one.  So, I've built my own. There appears to be an old recurly demo rails app but from the looks of it is not Rails v3.  So I decided to build my own.   

Once this is completed, you should be able to simply fork and clone the project and have recurly up and running with your own pricing page, payment page, and login integration.


**Notes**
1. You must set the environment variables RECURLY_API_KEY and RECURLY_JS_PRIVATE_KEY to get the app running
2. Also right now I've set the asset pipeline to user live compiling in production.  If you want to change, feel free to ... read up on it here: https://devcenter.heroku.com/articles/rails3x-asset-pipeline-cedar
3. As usual, you must run *heroku run rake db:migrate* if you're using heroku to host the sample project