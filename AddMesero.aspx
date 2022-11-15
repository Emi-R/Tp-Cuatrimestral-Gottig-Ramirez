<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AddMesero.aspx.cs" Inherits="TP_Cuatrimestral.AddMesero" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="pt-2">
            <h1 class="title-page display-2 pb-3">Nuevo mesero</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-3"></div>
        <div class="col-6">
            <div class="boxForm">
                <!-- 2 column grid layout with text inputs for the first and last names -->
                <div class="row mb-4">
                    <div class="col">
                        <div class="form-outline form-white">
                            <input type="text" id="form6Example1" class="form-control" />
                            <label class="form-label" for="form6Example1">First name</label>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-outline form-white">
                            <input type="text" id="form6Example2" class="form-control" />
                            <label class="form-label" for="form6Example2">Last name</label>
                        </div>
                    </div>
                </div>

                <!-- Text input -->
                <div class="form-outline form-white mb-4">
                    <input type="text" id="form6Example3" class="form-control" />
                    <label class="form-label" for="form6Example3">Company name</label>
                </div>

                <!-- Text input -->
                <div class="form-outline form-white mb-4">
                    <input type="text" id="form6Example4" class="form-control" />
                    <label class="form-label" for="form6Example4">Address</label>
                </div>

                <!-- Email input -->
                <div class="form-outline form-white mb-4">
                    <input type="email" id="form6Example5" class="form-control" />
                    <label class="form-label" for="form6Example5">Email</label>
                </div>

                <!-- Number input -->
                <div class="form-outline form-white mb-4">
                    <input type="number" id="form6Example6" class="form-control" />
                    <label class="form-label" for="form6Example6">Phone</label>
                </div>

                <!-- Message input -->
                <div class="form-outline form-white mb-4">
                    <textarea class="form-control" id="form6Example7" rows="4"></textarea>
                    <label class="form-label" for="form6Example7">Additional information</label>
                </div>

                <!-- Checkbox -->
                <div class="form-check d-flex justify-content-center mb-4">
                    <input class="form-check-input me-2" type="checkbox" value="" id="form6Example8" checked />
                    <label class="form-check-label" for="form6Example8">Create an account? </label>
                </div>

                <!-- Submit button -->
                <button type="submit" class="btn btn-primary btn-block mb-4">Place order</button>
            </div>
        </div>
        <div class="col-3"></div>
    </div>

</asp:Content>
