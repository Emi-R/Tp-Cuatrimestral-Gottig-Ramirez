<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TP_Cuatrimestral.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row justify-content-center caja">
        <div class="col">
            <div class="row">
                <div class="col-6 align-self-center">
                    <div class="row">
                        <div class="col">
                            <h1>Login</h1>
                        </div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="container" style="width: 80%">
                        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <input type="email" id="form1Example1" class="form-control" />
                            <label class="form-label" for="form1Example1">Email address</label>
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-4">
                            <input type="password" id="form1Example2" class="form-control" />
                            <label class="form-label" for="form1Example2">Password</label>
                        </div>

                        <!-- 2 column grid layout for inline styling -->
                        <div class="row mb-4">
                            <div class="col d-flex justify-content-center">
                                <!-- Checkbox -->
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="form1Example3" checked />
                                    <label class="form-check-label" for="form1Example3">Remember me </label>
                                </div>
                            </div>

                            <div class="col">
                                <!-- Simple link -->
                                <a href="#!">Forgot password?</a>
                            </div>
                        </div>

                        <!-- Submit button -->
                        <button type="submit" class="btn btn-primary btn-block">Sign in</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>


</asp:Content>
