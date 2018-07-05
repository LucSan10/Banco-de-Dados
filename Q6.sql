/*UF -> Municipio -> Bairro -> CEP -> Endereço*/

INSERT INTO [UF] ([Cd_UF],[Nm_Estado],[Sg_UF]) VALUES(10,'Rio de Janeiro','RJ');
INSERT INTO [UF] ([Cd_UF],[Nm_Estado],[Sg_UF]) VALUES(20,'São Paulo','SP');
INSERT INTO [UF] ([Cd_UF],[Nm_Estado],[Sg_UF]) VALUES(30,'Minas Gerais','MG');
INSERT INTO [UF] ([Cd_UF],[Nm_Estado],[Sg_UF]) VALUES(40,'Rio Grande do Sul','RS');
INSERT INTO [UF] ([Cd_UF],[Nm_Estado],[Sg_UF]) VALUES(50,'Espírito Santo','ES');
GO

INSERT INTO [Municipio] ([Cd_Municipio],[Nm_Municipio],[Cd_UF]) VALUES(100,'Rio de Janeiro',10);
INSERT INTO [Municipio] ([Cd_Municipio],[Nm_Municipio],[Cd_UF]) VALUES(101,'Niteroi',10);
INSERT INTO [Municipio] ([Cd_Municipio],[Nm_Municipio],[Cd_UF]) VALUES(102,'Duque de Caxias',10);
INSERT INTO [Municipio] ([Cd_Municipio],[Nm_Municipio],[Cd_UF]) VALUES(103,'Petrópolis',10);
INSERT INTO [Municipio] ([Cd_Municipio],[Nm_Municipio],[Cd_UF]) VALUES(104,'Nova Friburgo',10);
GO

INSERT INTO [Bairro] ([Cd_Bairro],[Nm_Bairro],[Cd_UF], [Cd_Municipio]) VALUES(1000,'Recreio',10, 100);
INSERT INTO [Bairro] ([Cd_Bairro],[Nm_Bairro],[Cd_UF], [Cd_Municipio]) VALUES(1001,'Ilha do Governador',10, 100);
INSERT INTO [Bairro] ([Cd_Bairro],[Nm_Bairro],[Cd_UF], [Cd_Municipio]) VALUES(1002,'Laranjeiras',10, 100);
INSERT INTO [Bairro] ([Cd_Bairro],[Nm_Bairro],[Cd_UF], [Cd_Municipio]) VALUES(1003,'Marechal Hermes',10, 100);
INSERT INTO [Bairro] ([Cd_Bairro],[Nm_Bairro],[Cd_UF], [Cd_Municipio]) VALUES(1004,'Penha',10, 100);
INSERT INTO [Bairro] ([Cd_Bairro],[Nm_Bairro],[Cd_UF], [Cd_Municipio]) VALUES(21,'Ícarai',10, 102);
GO
INSERT INTO [Bairro] ([Cd_Bairro],[Nm_Bairro],[Cd_UF], [Cd_Municipio]) VALUES(22,'São Francisco ',10, 102);
INSERT INTO [Bairro] ([Cd_Bairro],[Nm_Bairro],[Cd_UF], [Cd_Municipio]) VALUES(23,'Itacoatiara',10, 102);
INSERT INTO [Bairro] ([Cd_Bairro],[Nm_Bairro],[Cd_UF], [Cd_Municipio]) VALUES(41,'Quitandinha',10, 104);
INSERT INTO [Bairro] ([Cd_Bairro],[Nm_Bairro],[Cd_UF], [Cd_Municipio]) VALUES(42,'Valparaíso',10, 104);
INSERT INTO [Bairro] ([Cd_Bairro],[Nm_Bairro],[Cd_UF], [Cd_Municipio]) VALUES(51,'Conselheiro Paulino',10, 104);
INSERT INTO [Bairro] ([Cd_Bairro],[Nm_Bairro],[Cd_UF], [Cd_Municipio]) VALUES(52,'Floresta',10, 104);
GO

INSERT INTO [CEP] ([Cd_CEP],[Cd_Bairro],[Cd_Municipio], [Cd_UF]) VALUES(25014112, 51, 101, 10);
INSERT INTO [CEP] ([Cd_CEP],[Cd_Bairro],[Cd_Municipio], [Cd_UF]) VALUES(78723058, 52, 100, 10);
INSERT INTO [CEP] ([Cd_CEP],[Cd_Bairro],[Cd_Municipio], [Cd_UF]) VALUES(65941360, 23, 104, 10);
INSERT INTO [CEP] ([Cd_CEP],[Cd_Bairro],[Cd_Municipio], [Cd_UF]) VALUES(97543959, 1000, 103, 10);
INSERT INTO [CEP] ([Cd_CEP],[Cd_Bairro],[Cd_Municipio], [Cd_UF]) VALUES(72437211, 1001, 102, 10);
INSERT INTO [CEP] ([Cd_CEP],[Cd_Bairro],[Cd_Municipio], [Cd_UF]) VALUES(43907462, 1004, 100, 10);
GO

INSERT INTO [Endereço] ([Cd_Endereço],[Nm_Complemento],[Nu_Número], [Nm_Endereço], [Cd_Municipio], [Cd_CEP], [Cd_UF], [Cd_Bairro]) VALUES(600, 'Casa', 832, 'Rua Daniel Jacintho', 100, 78723058, 10, 1000);
INSERT INTO [Endereço] ([Cd_Endereço],[Nm_Complemento],[Nu_Número], [Nm_Endereço], [Cd_Municipio], [Cd_CEP], [Cd_UF], [Cd_Bairro]) VALUES(601, 'Casa', 885, 'Rua Padre Des Touches', 100, 43907462, 10, 1001);
INSERT INTO [Endereço] ([Cd_Endereço],[Nm_Complemento],[Nu_Número], [Nm_Endereço], [Cd_Municipio], [Cd_CEP], [Cd_UF], [Cd_Bairro]) VALUES(602, 'Casa', 766, 'Rua Jerônyma Mesquita', 101, 25014112, 10, 21);
INSERT INTO [Endereço] ([Cd_Endereço],[Nm_Complemento],[Nu_Número], [Nm_Endereço], [Cd_Municipio], [Cd_CEP], [Cd_UF], [Cd_Bairro]) VALUES(603, 'Casa', 427, 'Rua Alberto Sampaio', 102, 72437211, 10, 1002);
INSERT INTO [Endereço] ([Cd_Endereço],[Nm_Complemento],[Nu_Número], [Nm_Endereço], [Cd_Municipio], [Cd_CEP], [Cd_UF], [Cd_Bairro]) VALUES(604, 'Casa', 407, 'Rua Cinco', 103, 97543959, 10, 42);
INSERT INTO [Endereço] ([Cd_Endereço],[Nm_Complemento],[Nu_Número], [Nm_Endereço], [Cd_Municipio], [Cd_CEP], [Cd_UF], [Cd_Bairro]) VALUES(605, 'Casa', 495, 'Rua Cardeal Maury', 104, 65941360, 10, 51);
GO
INSERT INTO [Endereço] ([Cd_Endereço],[Nm_Complemento],[Nu_Número], [Nm_Endereço], [Cd_Municipio], [Cd_CEP], [Cd_UF], [Cd_Bairro]) VALUES(606, 'Apt. 1101', 566, 'Rua B', 100, 65941360, 10, 1003);
INSERT INTO [Endereço] ([Cd_Endereço],[Nm_Complemento],[Nu_Número], [Nm_Endereço], [Cd_Municipio], [Cd_CEP], [Cd_UF], [Cd_Bairro]) VALUES(607, 'Apt. 705', 599, 'Rua Billy Blanco', 104, 25014112, 10, 51);
INSERT INTO [Endereço] ([Cd_Endereço],[Nm_Complemento],[Nu_Número], [Nm_Endereço], [Cd_Municipio], [Cd_CEP], [Cd_UF], [Cd_Bairro]) VALUES(608, 'Apt. 207', 100, 'Rua Doutor Eliseu', 101, 25014112, 10, 23);
INSERT INTO [Endereço] ([Cd_Endereço],[Nm_Complemento],[Nu_Número], [Nm_Endereço], [Cd_Municipio], [Cd_CEP], [Cd_UF], [Cd_Bairro]) VALUES(609, 'Apt. 408', 560, 'Rua Oito A', 102, 72437211, 10, 1004);
INSERT INTO [Endereço] ([Cd_Endereço],[Nm_Complemento],[Nu_Número], [Nm_Endereço], [Cd_Municipio], [Cd_CEP], [Cd_UF], [Cd_Bairro]) VALUES(610, 'Apt. 903', 376, 'Rua Serapião Caldas', 100, 43907462, 10, 1000);
GO

INSERT INTO [Produto] ([Cd_Produto],[Ds_Produto],[Vl_Unitário], [Ds_Marca], [Ps_Peso], [In_ICMS], [In_IPI], [Vl_Seguro]) VALUES(1, 'ABOBRINHA KG', 2.3, 'VERDE MAIS', 1, 0.276, 0, 0.046);
INSERT INTO [Produto] ([Cd_Produto],[Ds_Produto],[Vl_Unitário], [Ds_Marca], [Ps_Peso], [In_ICMS], [In_IPI], [Vl_Seguro]) VALUES(2, 'PAR DE CHINELO', 7.4, 'PÉ ROYAL', 0.3, 0.888, 0, 0.148);
INSERT INTO [Produto] ([Cd_Produto],[Ds_Produto],[Vl_Unitário], [Ds_Marca], [Ps_Peso], [In_ICMS], [In_IPI], [Vl_Seguro]) VALUES(3, 'CAMISA SELECAO', 12, 'BRASIL MARCAS', 0.2, 1.44, 0, 0.24);
INSERT INTO [Produto] ([Cd_Produto],[Ds_Produto],[Vl_Unitário], [Ds_Marca], [Ps_Peso], [In_ICMS], [In_IPI], [Vl_Seguro]) VALUES(4, 'CANETA ESFEROGRAFICA', 0.9, 'PAPEL E ARTE', 0.07, 0.108, 0, 0);
INSERT INTO [Produto] ([Cd_Produto],[Ds_Produto],[Vl_Unitário], [Ds_Marca], [Ps_Peso], [In_ICMS], [In_IPI], [Vl_Seguro]) VALUES(5, 'CADERNO WINX', 9, 'PAPEL E ARTE', 0.5, 1.08, 0, 0.18);
INSERT INTO [Produto] ([Cd_Produto],[Ds_Produto],[Vl_Unitário], [Ds_Marca], [Ps_Peso], [In_ICMS], [In_IPI], [Vl_Seguro]) VALUES(6, 'KIT FOGO (EXTINTOR + MANGUEIRA)', 299.99, 'MENGÃO FOGOS', 11.7, 35.9988, 14.9995, 5.9998);
GO
INSERT INTO [Produto] ([Cd_Produto],[Ds_Produto],[Vl_Unitário], [Ds_Marca], [Ps_Peso], [In_ICMS], [In_IPI], [Vl_Seguro]) VALUES(7, 'DVD O RAPPA AO VIVO', 29.9, 'ULTRA-SOM', 0.25, 3.588, 0, 0.598);
INSERT INTO [Produto] ([Cd_Produto],[Ds_Produto],[Vl_Unitário], [Ds_Marca], [Ps_Peso], [In_ICMS], [In_IPI], [Vl_Seguro]) VALUES(8, 'FONE DE OUVIDO AZUL', 4.5, 'SATELITE ELETRONICA', 0.1, 0.54, 0, 0.09);
INSERT INTO [Produto] ([Cd_Produto],[Ds_Produto],[Vl_Unitário], [Ds_Marca], [Ps_Peso], [In_ICMS], [In_IPI], [Vl_Seguro]) VALUES(9, 'TRATOR P/ COLHEITA', 59300, 'AGROFLEX', 3172.9, 7116, 2965, 1186);
INSERT INTO [Produto] ([Cd_Produto],[Ds_Produto],[Vl_Unitário], [Ds_Marca], [Ps_Peso], [In_ICMS], [In_IPI], [Vl_Seguro]) VALUES(10, 'ESCOVA DE DENTES', 18.2, 'RISOLEX', 0.14, 2.184, 0, 0.364);
INSERT INTO [Produto] ([Cd_Produto],[Ds_Produto],[Vl_Unitário], [Ds_Marca], [Ps_Peso], [In_ICMS], [In_IPI], [Vl_Seguro]) VALUES(11, 'FIO DENTAL', 25, 'VERÃO MODAS', 0.23, 3, 0, 0.5);
GO

INSERT INTO [Cliente] ([Cd_Cliente]) VALUES(500);
INSERT INTO [Cliente] ([Cd_Cliente]) VALUES(501);
INSERT INTO [Cliente] ([Cd_Cliente]) VALUES(502);
INSERT INTO [Cliente] ([Cd_Cliente]) VALUES(503);
INSERT INTO [Cliente] ([Cd_Cliente]) VALUES(504);
INSERT INTO [Cliente] ([Cd_Cliente]) VALUES(505);
GO
INSERT INTO [Cliente] ([Cd_Cliente]) VALUES(506);
INSERT INTO [Cliente] ([Cd_Cliente]) VALUES(507);
INSERT INTO [Cliente] ([Cd_Cliente]) VALUES(508);
INSERT INTO [Cliente] ([Cd_Cliente]) VALUES(509);
INSERT INTO [Cliente] ([Cd_Cliente]) VALUES(510);
GO

INSERT INTO [Telefone] ([Nu_Telefone], [Cd_DDD], [Cd_Telefone]) VALUES(948142775, 21, 701);
INSERT INTO [Telefone] ([Nu_Telefone], [Cd_DDD], [Cd_Telefone]) VALUES(940006676, 21, 702);
INSERT INTO [Telefone] ([Nu_Telefone], [Cd_DDD], [Cd_Telefone]) VALUES(913512930, 21, 703);
INSERT INTO [Telefone] ([Nu_Telefone], [Cd_DDD], [Cd_Telefone]) VALUES(937905986, 21, 704);
INSERT INTO [Telefone] ([Nu_Telefone], [Cd_DDD], [Cd_Telefone]) VALUES(977796161, 21, 705);
INSERT INTO [Telefone] ([Nu_Telefone], [Cd_DDD], [Cd_Telefone]) VALUES(995603673, 22, 706);
INSERT INTO [Telefone] ([Nu_Telefone], [Cd_DDD], [Cd_Telefone]) VALUES(995176513, 22, 707);
GO

INSERT INTO [Telefone] ([Nu_Telefone], [Cd_DDD], [Cd_Telefone]) VALUES(984274381, 22, 708);
INSERT INTO [Telefone] ([Nu_Telefone], [Cd_DDD], [Cd_Telefone]) VALUES(992951544, 21, 709);
INSERT INTO [Telefone] ([Nu_Telefone], [Cd_DDD], [Cd_Telefone]) VALUES(991831244, 21, 711);
INSERT INTO [Telefone] ([Nu_Telefone], [Cd_DDD], [Cd_Telefone]) VALUES(997376269, 22, 712);
INSERT INTO [Telefone] ([Nu_Telefone], [Cd_DDD], [Cd_Telefone]) VALUES(993824065, 22, 713);
INSERT INTO [Telefone] ([Nu_Telefone], [Cd_DDD], [Cd_Telefone]) VALUES(994236866, 21, 714);
INSERT INTO [Telefone] ([Nu_Telefone], [Cd_DDD], [Cd_Telefone]) VALUES(995757643, 21, 715);
GO

INSERT INTO [Telefone_Cliente] ([Cd_Telefone], [Cd_Cliente]) VALUES(701, 500);
INSERT INTO [Telefone_Cliente] ([Cd_Telefone], [Cd_Cliente]) VALUES(702, 501);
INSERT INTO [Telefone_Cliente] ([Cd_Telefone], [Cd_Cliente]) VALUES(703, 502);
INSERT INTO [Telefone_Cliente] ([Cd_Telefone], [Cd_Cliente]) VALUES(704, 503);
INSERT INTO [Telefone_Cliente] ([Cd_Telefone], [Cd_Cliente]) VALUES(705, 504);
INSERT INTO [Telefone_Cliente] ([Cd_Telefone], [Cd_Cliente]) VALUES(706, 505);
GO
INSERT INTO [Telefone_Cliente] ([Cd_Telefone], [Cd_Cliente]) VALUES(707, 505);
INSERT INTO [Telefone_Cliente] ([Cd_Telefone], [Cd_Cliente]) VALUES(708, 505);
INSERT INTO [Telefone_Cliente] ([Cd_Telefone], [Cd_Cliente]) VALUES(709, 506);
INSERT INTO [Telefone_Cliente] ([Cd_Telefone], [Cd_Cliente]) VALUES(711, 507);
INSERT INTO [Telefone_Cliente] ([Cd_Telefone], [Cd_Cliente]) VALUES(712, 508);
INSERT INTO [Telefone_Cliente] ([Cd_Telefone], [Cd_Cliente]) VALUES(713, 509);
INSERT INTO [Telefone_Cliente] ([Cd_Telefone], [Cd_Cliente]) VALUES(714, 510);
INSERT INTO [Telefone_Cliente] ([Cd_Telefone], [Cd_Cliente]) VALUES(715, 510);
GO

INSERT INTO [Logradouro] ([Cd_Endereço],[Cd_Cliente]) VALUES(600, 500);
INSERT INTO [Logradouro] ([Cd_Endereço],[Cd_Cliente]) VALUES(601, 501);
INSERT INTO [Logradouro] ([Cd_Endereço],[Cd_Cliente]) VALUES(602, 502);
INSERT INTO [Logradouro] ([Cd_Endereço],[Cd_Cliente]) VALUES(603, 503);
INSERT INTO [Logradouro] ([Cd_Endereço],[Cd_Cliente]) VALUES(604, 504);
INSERT INTO [Logradouro] ([Cd_Endereço],[Cd_Cliente]) VALUES(605, 505);
GO
INSERT INTO [Logradouro] ([Cd_Endereço],[Cd_Cliente]) VALUES(606, 506);
INSERT INTO [Logradouro] ([Cd_Endereço],[Cd_Cliente]) VALUES(607, 507);
INSERT INTO [Logradouro] ([Cd_Endereço],[Cd_Cliente]) VALUES(608, 508);
INSERT INTO [Logradouro] ([Cd_Endereço],[Cd_Cliente]) VALUES(609, 509);
INSERT INTO [Logradouro] ([Cd_Endereço],[Cd_Cliente]) VALUES(610, 510);
GO

INSERT INTO [Pessoa_Física] ([Cd_CPF], [Nm_Cliente], [Cd_Cliente], [Cd_PF]) VALUES(15452470050, 'Gustavo Oliveira', 500, 0);
INSERT INTO [Pessoa_Física] ([Cd_CPF], [Nm_Cliente], [Cd_Cliente], [Cd_PF]) VALUES(40305630075, 'João André Mendes', 501, 1);
INSERT INTO [Pessoa_Física] ([Cd_CPF], [Nm_Cliente], [Cd_Cliente], [Cd_PF]) VALUES(83118049073, 'Victor Santiago', 502, 2);
INSERT INTO [Pessoa_Física] ([Cd_CPF], [Nm_Cliente], [Cd_Cliente], [Cd_PF]) VALUES(84222915092, 'Jessica Maciel', 503, 3);
INSERT INTO [Pessoa_Física] ([Cd_CPF], [Nm_Cliente], [Cd_Cliente], [Cd_PF]) VALUES(99982159003, 'João Paulo Lopes', 504, 4);
INSERT INTO [Pessoa_Física] ([Cd_CPF], [Nm_Cliente], [Cd_Cliente], [Cd_PF]) VALUES(46568632031, 'Wandergledson Palma', 505, 5);
GO

INSERT INTO [Pessoa_Jurídica] ([Cd_CPNJ], [Nm_Razão_Social], [Cd_Inscrição_Estadual], [Cd_Cliente], [Cd_PJ]) VALUES(48558317000174, 'Luiza e Daniela Doces & Salgados ME', 60534900, 508, 1);
INSERT INTO [Pessoa_Jurídica] ([Cd_CPNJ], [Nm_Razão_Social], [Cd_Inscrição_Estadual], [Cd_Cliente], [Cd_PJ]) VALUES(52299805000181, 'Oliver e Clara Joalheria ME', 93847865, 507, 2);
INSERT INTO [Pessoa_Jurídica] ([Cd_CPNJ], [Nm_Razão_Social], [Cd_Inscrição_Estadual], [Cd_Cliente], [Cd_PJ]) VALUES(37668932000117, 'Malu e Levi Limpeza ME', 91280710, 506, 3);
INSERT INTO [Pessoa_Jurídica] ([Cd_CPNJ], [Nm_Razão_Social], [Cd_Inscrição_Estadual], [Cd_Cliente], [Cd_PJ]) VALUES(10155111000120, 'Cecília e Maria Padaria ME', 39876264, 510, 4);
INSERT INTO [Pessoa_Jurídica] ([Cd_CPNJ], [Nm_Razão_Social], [Cd_Inscrição_Estadual], [Cd_Cliente], [Cd_PJ]) VALUES(46632873000118, 'Matheus e Nelson Marcenaria ME', 25238990, 509, 5);
GO

INSERT INTO [Nota_Fiscal] ([Cd_Nota_Fiscal],[Dt_Emissão],[Dt_Entrega], [Cd_Cliente]) VALUES(1, 06/02/2018, 06/03/2018, 500);
INSERT INTO [Nota_Fiscal] ([Cd_Nota_Fiscal],[Dt_Emissão],[Dt_Entrega], [Cd_Cliente]) VALUES(2, 06/02/2019, 06/03/2019, 501);
INSERT INTO [Nota_Fiscal] ([Cd_Nota_Fiscal],[Dt_Emissão],[Dt_Entrega], [Cd_Cliente]) VALUES(3, 06/02/2020, 06/03/2020, 502);
INSERT INTO [Nota_Fiscal] ([Cd_Nota_Fiscal],[Dt_Emissão],[Dt_Entrega], [Cd_Cliente]) VALUES(4, 06/02/2021, 06/03/2021, 503);
INSERT INTO [Nota_Fiscal] ([Cd_Nota_Fiscal],[Dt_Emissão],[Dt_Entrega], [Cd_Cliente]) VALUES(5, 06/02/2022, 06/03/2022, 505);
INSERT INTO [Nota_Fiscal] ([Cd_Nota_Fiscal],[Dt_Emissão],[Dt_Entrega], [Cd_Cliente]) VALUES(6, 06/02/2023, 06/03/2023, 504);
GO

INSERT INTO [Duplicata] ([Cd_Duplicata], [Dt_Vencimento], [Vl_Valor], [Dt_Pagamento], [Vl_Pagamento], [Cd_Nota_Fiscal]) VALUES(111, '06/12/2018', 70, 06/01/2018, 0.7, 1);
INSERT INTO [Duplicata] ([Cd_Duplicata], [Dt_Vencimento], [Vl_Valor], [Dt_Pagamento], [Vl_Pagamento], [Cd_Nota_Fiscal]) VALUES(112, '06/22/2018', 70, 06/01/2018, 0.7, 1);
INSERT INTO [Duplicata] ([Cd_Duplicata], [Dt_Vencimento], [Vl_Valor], [Dt_Pagamento], [Vl_Pagamento], [Cd_Nota_Fiscal]) VALUES(441, '06/20/2018', 2020290.37, 06/09/2018, 20202.9037, 4);
INSERT INTO [Duplicata] ([Cd_Duplicata], [Dt_Vencimento], [Vl_Valor], [Dt_Pagamento], [Vl_Pagamento], [Cd_Nota_Fiscal]) VALUES(551, '06/22/2018', 49.5, 06/11/2018, 0.495, 5);
GO

INSERT INTO [Transporte] ([Cd_Transporte], [Cd_Espécie], [Vl_Frete], [Cd_PJ]) VALUES(901, 1, 10, 1);
INSERT INTO [Transporte] ([Cd_Transporte], [Cd_Espécie], [Vl_Frete], [Cd_PJ]) VALUES(902, 2, 20, 1);
INSERT INTO [Transporte] ([Cd_Transporte], [Cd_Espécie], [Vl_Frete], [Cd_PJ]) VALUES(903, 3, 40, 2);
INSERT INTO [Transporte] ([Cd_Transporte], [Cd_Espécie], [Vl_Frete], [Cd_PJ]) VALUES(904, 4, 80, 3);
INSERT INTO [Transporte] ([Cd_Transporte], [Cd_Espécie], [Vl_Frete], [Cd_PJ]) VALUES(905, 5, 160, 5);
INSERT INTO [Transporte] ([Cd_Transporte], [Cd_Espécie], [Vl_Frete], [Cd_PJ]) VALUES(906, 6, 320, 5);
INSERT INTO [Transporte] ([Cd_Transporte], [Cd_Espécie], [Vl_Frete], [Cd_PJ]) VALUES(907, 7, 640, 4);
INSERT INTO [Transporte] ([Cd_Transporte], [Cd_Espécie], [Vl_Frete], [Cd_PJ]) VALUES(908, 8, 1280, 4);
INSERT INTO [Transporte] ([Cd_Transporte], [Cd_Espécie], [Vl_Frete], [Cd_PJ]) VALUES(909, 9, 2560, 4);
GO

INSERT INTO [Veiculo] ([Cd_Veiculo], [Cd_Placa], [Cd_Transporte], [Cd_Municipio], [Cd_UF]) VALUES(801, 'KTQ2310', 901, 102, 10);
INSERT INTO [Veiculo] ([Cd_Veiculo], [Cd_Placa], [Cd_Transporte], [Cd_Municipio], [Cd_UF]) VALUES(802, 'KUF1056', 902, 102, 10);
INSERT INTO [Veiculo] ([Cd_Veiculo], [Cd_Placa], [Cd_Transporte], [Cd_Municipio], [Cd_UF]) VALUES(803, 'LMG3179', 903, 102, 10);
INSERT INTO [Veiculo] ([Cd_Veiculo], [Cd_Placa], [Cd_Transporte], [Cd_Municipio], [Cd_UF]) VALUES(804, 'KSX4779', 904, 102, 10);
INSERT INTO [Veiculo] ([Cd_Veiculo], [Cd_Placa], [Cd_Transporte], [Cd_Municipio], [Cd_UF]) VALUES(805, 'KXS3472', 905, 102, 10);
GO

INSERT INTO [Saida] ([Dt_Saida], [Hd_Saida], [Cd_Saida], [Cd_Transporte]) VALUES('06/02/2018', '13:45', 401, 901);
INSERT INTO [Saida] ([Dt_Saida], [Hd_Saida], [Cd_Saida], [Cd_Transporte]) VALUES('06/05/2018', '14:45', 402, 902);
INSERT INTO [Saida] ([Dt_Saida], [Hd_Saida], [Cd_Saida], [Cd_Transporte]) VALUES('06/10/2018', '15:32', 403, 903);
INSERT INTO [Saida] ([Dt_Saida], [Hd_Saida], [Cd_Saida], [Cd_Transporte]) VALUES('06/12/2018', '15:48', 404, 904);
GO
INSERT INTO [Saida] ([Dt_Saida], [Hd_Saida], [Cd_Saida], [Cd_Transporte]) VALUES('06/15/2018', '16:12', 405, 905);
INSERT INTO [Saida] ([Dt_Saida], [Hd_Saida], [Cd_Saida], [Cd_Transporte]) VALUES('06/18/2018', '8:35', 406, 906);
INSERT INTO [Saida] ([Dt_Saida], [Hd_Saida], [Cd_Saida], [Cd_Transporte]) VALUES('06/20/2018', '9:15', 407, 907);
INSERT INTO [Saida] ([Dt_Saida], [Hd_Saida], [Cd_Saida], [Cd_Transporte]) VALUES('06/25/2018', '12:30', 408, 908);
INSERT INTO [Saida] ([Dt_Saida], [Hd_Saida], [Cd_Saida], [Cd_Transporte]) VALUES('06/26/2018', '11:15', 409, 909);
GO

INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(1, 1, 1, 401);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(7, 1, 1, 401);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(4, 2, 1, 408);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(3, 3, 1, 401);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(5, 5, 2, 402);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(2, 8, 2, 405);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(4, 13, 2, 405);
GO
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(7, 21, 2, 402);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(5, 34, 3, 403);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(3, 55, 3, 407);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(11, 1, 3, 407);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(1, 1, 3, 407);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(10, 2, 3, 403);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(5, 3, 3, 403);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(1, 5, 3, 403);
GO
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(3, 8, 4, 406);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(6, 13, 4, 406);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(8, 21, 4, 404);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(9, 34, 4, 404);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(1, 1, 5, 409);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(2, 1, 5, 409);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(3, 1, 5, 409);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(4, 1, 5, 409);
GO
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(5, 1, 5, 409);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(6, 1, 5, 409);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(7, 1, 5, 409);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(8, 1, 5, 409);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(9, 1, 5, 409);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(10, 1, 5, 409);
INSERT INTO [Compra] ([Cd_Produto],[Qt_Produtos],[Cd_Nota_Fiscal], [Cd_Saida]) VALUES(11, 1, 5, 409);
GO
