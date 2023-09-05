<%@ Page Async="true" Language="C#" AutoEventWireup="true" CodeBehind="HomeBookStore.aspx.cs" Inherits="WebApplicationBookStore.Views.HomeBookStore" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <title>Home gerenciamento de livros</title>
</head>
<body>
    <form id="form1" runat="server">

        <header class="p-3 text-bg-light">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
                            <use xlink:href="#bootstrap" />
                        </svg>
                    </a>

                    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                        <li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
                        <li><a href="#" class="nav-link px-2">Features</a></li>
                        <li><a href="#" class="nav-link px-2">Pricing</a></li>
                        <li><a href="#" class="nav-link px-2">FAQs</a></li>
                        <li><a href="#" class="nav-link px-2">About</a></li>
                    </ul>

                    <div class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                        <input type="search" class="form-control" placeholder="Search..." aria-label="Search" />
                    </div>

                    <div class="text-end">
                        <button type="button" class="btn btn-outline-light me-2">Login</button>
                        <button type="button" class="btn btn-primary">Sign-up</button>
                    </div>
                </div>
            </div>
        </header>

        <%--<input type="text" id="TxbId" runat="server" class="form-control me-2" placeholder="Pesquise pelo ID do livro" aria-label="Search" />--%>
        <%--<button type="button" class="btn btn-outline-success" id="BtnShowSelectNumberBook" runat="server" onserverclick="BtnShowSelectNumberBook_Click">mostre o livro selecionado</button>--%>

        <div class="container">
            <button type="button" class="btn btn-success" id="BtnOpenModalAddBook" data-bs-toggle="modal" data-bs-target="#modalAddBook">Adicionar novo livro</button>

            <table class="table" id="TableBooks">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Código ID</th>
                        <th scope="col">Nome</th>
                        <th scope="col">Autor</th>
                        <th scope="col">Preço</th>
                        <th scope="col">Botões</th>
                    </tr>
                </thead>
                <tbody id="TbodyBooks" runat="server">
                </tbody>
            </table>
        </div>


        <!-- MODAL ADD NEW BOOK-->
        <div class="modal fade" id="modalAddBook" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropAddBookLabel">Novo Livro</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" runat="server"></button>
                    </div>
                    <div class="modal-body">
                        <div id="divAddProduto">
                            <div id="DivAlertAddNewBook" runat="server" class="alert alert-danger mb-3" visible="false">
                                <label id="LblAlertAddNewBook" runat="server"></label>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Nome</label>
                                <input id="TxbNameBookToAdd" type="text" class="form-control" runat="server" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Autor</label>
                                <input id="TxbAutorBookToAdd" type="text" class="form-control" runat="server" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Preço</label>
                                <input id="TxbPriceBookToAdd" type="text" class="form-control" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" type="submit" runat="server" id="BtnAddBook" onserverclick="BtnAddBook_Click">Salvar</button>
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" runat="server" id="btnCancelarAddProduto">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>

        <%--MODAL UPDATE BOOK--%>
        <div class="modal fade" id="modalUpdateBook" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropUpdateBookLabel">Editar Livro</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" runat="server"></button>
                    </div>
                    <div class="modal-body">
                        <div id="divModalBodyUpdateBook">
                            <div id="DivAlertUpdateBook" runat="server" class="alert alert-danger mb-3" visible="false">
                                <label id="LblAlertUpdateBook" runat="server"></label>
                            </div>
                            <div class="mb-3" visible="false">
                                <label class="form-label">Id</label>
                                <input id="TxbIdBookToUpdate" type="text" class="form-control" runat="server" disabled="disabled" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Nome</label>
                                <input id="TxbNameBookToUpdate" type="text" class="form-control" runat="server" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Autor</label>
                                <input id="TxbAutorBookToUpdate" type="text" class="form-control" runat="server" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Preço</label>
                                <input id="TxbPriceBookToUpdate" type="text" class="form-control" runat="server" />
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" runat="server" id="BtnUpdateBook" onserverclick="BtnUpdateBook_Click">Editar</button>
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" runat="server" id="Button1">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- MODAL DELETE BOOK-->
        <div class="modal fade" id="modalDeleteBook" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropeDeleteBookLabel">Excluir Livro</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" runat="server"></button>
                    </div>
                    <div class="modal-body">
                        <div id="divExcluirProduto">
                            Deseja excluir libro?
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" runat="server" id="BtnDeleteBook" onserverclick="BtnDeleteBook_Click">Sim</button>
                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" runat="server" id="Button2">Não</button>
                    </div>
                </div>
            </div>
        </div>

        <%--INVISIBLE LABEL TO SELECT Nº OF THE LINE TO OPEN THE CORRECT MODAL--%>
        <asp:HiddenField ID="ValueHiddenField"
            Value=""
            runat="server" />
    </form>

    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/jquery-3.7.0.min.js"></script>
    <script src="../Scripts/HomeBookStoreJS.js"></script>
</body>
</html>
