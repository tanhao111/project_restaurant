<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Edit Product</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        input[type=text], select, textarea {
            width: 100%; /* Full width */
            padding: 12px; /* Some padding */
            border: 1px solid #ccc; /* Gray border */
            border-radius: 4px; /* Rounded borders */
            box-sizing: border-box; /* Make sure that padding and width stays in place */
            margin-top: 6px; /* Add a top margin */
            margin-bottom: 16px; /* Bottom margin */
            resize: vertical /* Allow the user to vertically resize the textarea (not horizontally) */
        }

        /* Style the submit button with a specific background color etc */
        input[type=submit] {
            background-color: #04AA6D;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        /* When moving the mouse over the submit button, add a darker green color */
        input[type=submit]:hover {
            background-color: #45a049;
        }

        /* Add a background color and some padding around the form */
        .container {
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 20px;
        }
    </style>
</head>
<body>
<div class="container">
<form:form method="POST" action="/editsaveproduct" enctype="multipart/form-data">
    <table >
        <tr>
            <td></td>
            <td><form:hidden  path="id" /></td>
        </tr>

        <tr>
            <label for="name">Name</label>
            <form:input path="name" id="name" placeholder="Product name.."/>
        </tr>

        <tr>
            <label for="description">Desription</label>
            <form:input path="description" id="description" placeholder="Description.."/>
        </tr>

        <tr>
            <label for="Price">Price</label>
            <form:input path="price" id="Price" placeholder="Price.." required="true" min="1" type="number"/>
        </tr>

        <tr>
            <label for="Amount">Amount</label>
            <form:input path="amount" id="Amount" placeholder="Amount.." required="true" min="1" max="100" type="number"/>
        </tr>

        <tr>
            <label>Category</label>
            <form:select path="cate_id">
                <%--            <option value="australia">Australia</option>--%>
                <c:forEach var="product" items="${list}">
                    <option  value="${product.id}">${product.name}</option>
                </c:forEach>
            </form:select>
        </tr>

        <tr>
            <label>Image : </label>

        </tr>
        <tr>
            <input type="file" name="file"/>
        </tr>

        <tr>
            <td> </td>
            <td><input type="submit" value="Edit Save" /></td>
        </tr>
    </table>
</form:form>
</div>
</body>
