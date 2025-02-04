<%--
  Created by IntelliJ IDEA.
  User: Maxime
  Date: 28/07/2020
  Time: 18:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page info="colonne de droit" contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="entities.RoleUser" %>
<%@ page import="util.NameRole" %>

<section id="connection">
    <h2>Connection</h2>
    <ul>

        <c:if test="${ not empty sessionScope.user.listeRole}">

            <c:choose>

                <c:when test="${fn:contains(sessionScope.user.listeRole[NameRole.ADMIN.name], NameRole.ADMIN.name) and
                fn:contains(sessionScope.user.listeRole[NameRole.USER_ARTICLE.name], NameRole.USER_ARTICLE.name)}">
                    <li>Avatar : ${sessionScope.user.avatar} </li>
                    <li>Vos droit :
                            ${sessionScope.user.listeRole[NameRole.ADMIN.name]} ET
                            ${sessionScope.user.listeRole[NameRole.USER_ARTICLE.name]}
                    </li>
                    <li><a href="<c:url value="/gestionAdmin"/>">GESTION DES ROLES</a></li>
                    <li><a href="<c:url value="/article"/>?page=articleCreate">CRÉATION D'ARTICLE</a></li>
                    <li><a href="<c:url value="/gestionAdmin"/>?identiter=formulaire">MODIFIER VOTRE IDENTITER</a></li>

                </c:when>

                <c:when test="${fn:contains(sessionScope.user.listeRole[NameRole.ADMIN.name], NameRole.ADMIN.name)}">

                    <li>Avatar : ${sessionScope.user.avatar} </li>
                    <li>Vos droit : ${sessionScope.user.listeRole[NameRole.ADMIN.name]} </li>
                    <li><a href="<c:url value="/gestionAdmin"/>">GESTION DES ROLES</a></li>
                    <li><a href="<c:url value="/gestionAdmin"/>?identiter=formulaire">MODIFIER VOTRE IDENTITER</a></li>

                </c:when>

                <c:when test="${fn:contains(sessionScope.user.listeRole[NameRole.USER_ARTICLE.name], NameRole.USER_ARTICLE.name)}">

                    <li>Avatar : ${sessionScope.user.avatar} </li>
                    <li>Vos droit : ${sessionScope.user.listeRole[NameRole.USER_ARTICLE.name]}</li>
                    <li><a href="<c:url value="/article"/>?page=articleCreate">CRÉATION D'ARTICLE</a></li>
                    <li><a href="<c:url value="/gestionAdmin"/>?identiter=formulaire">MODIFIER VOTRE IDENTITER</a></li>

                </c:when>

            </c:choose>

            <li><a href="<c:url value="/connection"/>?deconnexion=deconnexion">Déconnexion</a></li>

        </c:if>


        <c:if test="${ empty sessionScope.user.listeRole}">

            <c:if test="${sessionScope.user.attemp <3}">
                <li><a href="<c:url value="/connection"/>?connection=connection">Connection</a></li>
            </c:if>

            <c:if test="${sessionScope.user.attemp == 3}">
                <li>Echec de la connection</li>
                <li>apres 3 tentavie</li>
                <li>Reconnection possible a</li>
                <li>${sessionScope.user.waitingConnectionFormater}</li>
            </c:if>

        </c:if>

    </ul>
</section>

<section id="blogRecherche">
    <h2><label for="search">recherche</label></h2>
    <input type="search" name="search" id="search"/>
</section>
<!-- fin moteur de blogRecherche -->


<section id="categories">
    <h2>categories</h2>
    <ul>
        <li><a href="#">matériel&nbsp;<span>11</span></a></li>
        <li><a href="#">lightroom&nbsp;<span>2</span></a></li>
        <li><a href="#">technique&nbsp;<span>4</span></a></li>
        <li><a href="#">voyage&nbsp;<span>8</span></a></li>
    </ul>
</section>


<!-- fin Categories -->

<section id="blogAchives">
    <h2>archive</h2>
    <div>
        <h3><a href="#">années 2019&nbsp;<span>7</span></a></h3>
        <ul>
            <li><a href="#">janvier 2019&nbsp;<span>3</span></a></li>
            <li><a href="#">février 2019&nbsp;<span>2</span></a></li>
            <li><a href="#">mars 2019&nbsp;<span>1</span></a></li>
            <li><a href="#">avril 2019&nbsp;<span>1</span></a></li>
        </ul>
    </div>
    <div>
        <h3><a href="#">années 2020&nbsp;<span>9</span></a></h3>
        <ul>
            <li><a href="#">janvier 2020&nbsp;<span>2</span></a></li>
            <li><a href="#">février 2020&nbsp;<span>4</span></a></li>
            <li><a href="#">mars 2020&nbsp;<span>2</span></a></li>
            <li><a href="#">avril 2020&nbsp;<span>1</span></a></li>
        </ul>
    </div>

</section>
<!-- fin blogAchives -->


