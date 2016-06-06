[16] pry(main)> ty.trade_date = DateTime.parse("Mon, 10 Oct 2011 20:13:10 +0000")
=> Mon, 10 Oct 2011 20:13:10 +0000
[17] pry(main)> ty
=> #<Trade:0x007fac413dae10
 id: 1,
 direction: "Buy",
 size: 100,
 product: "TYU6",
 trade_date: Mon, 10 Oct 2011 20:13:10 +0000>
[18] pry(main)>

t= Date.parse("june 4 2016")
=> Sat, 04 Jun 2016

dateTime column might be a pain
be prepared to change the table
if I can't format the date correctly from the user

Do I want user to see their own trades only?
Or also see others' trades but only modify their own
Can there be a shared tradebook?

Aggregater. If you add to an existing position, the app adds it for you by editing the exisiting position

-make tables for trades, with recent closing prices and current value

-chart trades?
