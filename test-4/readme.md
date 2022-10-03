# App Events Query

I wasn't sure what exactly the question meant by 'parameters', since that term doesn't seem to mean much where SQL queries are concerned, so far as I could tell.

Also, due to totally misreading the question, I actually built an API for interacting with the database that takes month and bot_id as parameters, haha. I only realised I'd massively overcomplicated it once I was mostly finished. Since it wasn't at all what the question was asking I didn't include it, but you can [take a look at the code](https://github.com/Serenacula/bytedept-postgres-api) if interested.

## How to Optimise

I had a few thoughts on this. I imagine lookup tables would be useful? I've never actually used them before, but I *think* you could get the database to prebuild a table of results whenever it receives a new events that would qualify for counting. Then you just need to query/count that much smaller database.

Making sure that the order of operations is correct would also help. Conditions that cut down the number the most should be first, so that second passes with other conditions are faster to perform.
