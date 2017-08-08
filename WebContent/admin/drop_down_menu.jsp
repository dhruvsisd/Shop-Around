<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
<head>
<link href="css/dropdown.css" media="screen" rel="stylesheet" type="text/css" />
<link href="css/default.advanced.css" media="screen" rel="stylesheet" type="text/css" />
</head>

<body>
                         <ul class="dropdown dropdown-horizontal">  
				<li class="first"><a href="admin.jsp">Home</a></li>
                                
                                <li class="dir">Order
					<ul>
						<li class="first"><a href="pending_order.jsp">&nbsp;&nbsp;Pending</a></li>
						<li class="last"><a href="dispatched_order.jsp">&nbsp;&nbsp;Dispatched</a></li>
					</ul>
				</li>
                                
                                <li class="dir">Items
					<ul>
                                            <li class="first"><a href="add_item_1.jsp">&nbsp;&nbsp;&nbsp;Add</a></li>
                                                <li><a href="search.jsp">&nbsp;&nbsp;&nbsp;Search</a></li>
                                                <li class="last"><a href="view_all.jsp">&nbsp;&nbsp;&nbsp;View All</a></li>
					</ul>
				</li>
                                
                                <li class="dir">Category
					<ul>
                                            <li class="first"><a href="add_category.jsp">&nbsp;&nbsp;&nbsp;Add</a></li>
                                                <li class="last"><a href="view_all_category.jsp">&nbsp;&nbsp;&nbsp;View All</a></li>
					</ul>
				</li>
                                
                                <li class="dir">Account
					<ul>
                                                <li class="first"><a href="feedback.jsp">Feedback</a></li>
                                                <li class="last"><a href="user_registered.jsp">Users</a></li>
					</ul>
				</li>
                                
				<li class="dir">Setting
                                        <ul>
                                                <li class="first"><a href="change_password.jsp">&nbsp;&nbsp;Password</a></li>
                                                
					</ul>
                                </li>
				<li><a href="logout.jsp">Log Out</a></li>
			</ul>
		  
</body>
</html>