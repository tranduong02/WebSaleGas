<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang=""> <!--<![endif]-->

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Ela Admin - HTML5 Admin Template</title>
        <meta name="description" content="Ela Admin - HTML5 Admin Template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
        <link rel="stylesheet" href="assets/css/lib/chosen/chosen.min.css">

        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    </head>

    <body>


        <%@include file="component/leftpanel.jsp" %>

        <!-- Right Panel -->
        <div id="right-panel" class="right-panel">

            <div class="breadcrumbs">
                <div class="breadcrumbs-inner">
                    <div class="row m-0">
                        <div class="col-sm-4">
                            <div class="page-header float-left">
                                <div class="page-title">
                                    <h1>Dashboard</h1>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="page-header float-right">
                                <div class="page-title">
                                    <ol class="breadcrumb text-right">
                                        <li><a href="#">Dashboard</a></li>
                                        <li><a href="#">Forms</a></li>
                                        <li class="active">Advanced</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>




            <div class="content">
                <div class="animated fadeIn">
                    <div class="">
                        <c:if test="${requestScope.mess != null}">
                            <div class="mess-success"><span>${requestScope.mess}</span></div>
                        </c:if>
                        <form class="card" name="fs" action="addsupplier" method="post">
                            <div class="card-header">
                                <strong>Masked Input</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="form-group">
                                    <label class=" form-control-label">Supplier Name</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fas fa-tag"></i></div>
                                        <input class="form-control" name="supplierName" required="">
                                    </div>    
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">Company Name</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"> <i class="fas fa-building"></i> </div>
                                        <input class="form-control" name="companyName" required="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">Contact Information</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fas fa-envelope"></i></div>
                                        <input class="form-control" name="contactInfor">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">Phone Contact</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-phone"></i></div>
                                        <input class="form-control" name="phoneContact">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">Address</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fas fa-map-marker-alt"></i></div>
                                        <input class="form-control" name="address" required="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label"> Country </label>
                                    <div class="input-group-addon"><i class="fas fa-globe"></i></div>
                                    <select data-placeholder="Chọn quốc gia..." name="country" class="standardSelect" tabindex="1" required="">
                                        <option value="" label="mặc định"></option>
                                        <option value="Afghanistan">Afghanistan</option>
                                        <option value="Ai Cập">Ai Cập</option>
                                        <option value="Albania">Albania</option>
                                        <option value="Algeria">Algeria</option>
                                        <option value="Andorra">Andorra</option>
                                        <option value="Angola">Angola</option>
                                        <option value="Anh">Anh</option>
                                        <option value="Ấn Độ">Ấn Độ</option>
                                        <option value="Áo">Áo</option>
                                        <option value="Argentina">Argentina</option>
                                        <option value="Armenia">Armenia</option>
                                        <option value="Úc">Úc</option>
                                        <option value="Azerbaijan">Azerbaijan</option>
                                        <option value="Bahamas">Bahamas</option>
                                        <option value="Bahrain">Bahrain</option>
                                        <option value="Bangladesh">Bangladesh</option>
                                        <option value="Barbados">Barbados</option>
                                        <option value="Belarus">Belarus</option>
                                        <option value="Belize">Belize</option>
                                        <option value="Bénin">Bénin</option>
                                        <option value="Bhutan">Bhutan</option>
                                        <option value="Bỉ">Bỉ</option>
                                        <option value="Bolivia">Bolivia</option>
                                        <option value="Bosnia và Herzegovina">Bosnia và Herzegovina</option>
                                        <option value="Botswana">Botswana</option>
                                        <option value="Brazil">Brazil</option>
                                        <option value="Brunei">Brunei</option>
                                        <option value="Bulgaria">Bulgaria</option>
                                        <option value="Burkina Faso">Burkina Faso</option>
                                        <option value="Burundi">Burundi</option>
                                        <option value="Cabo Verde">Cabo Verde</option>
                                        <option value="Các tiểu vương quốc Ả Rập Thống nhất">Các tiểu vương quốc Ả Rập Thống nhất</option>
                                        <option value="Cameroon">Cameroon</option>
                                        <option value="Campuchia">Campuchia</option>
                                        <option value="Canada">Canada</option>
                                        <option value="Chile">Chile</option>
                                        <option value="Colombia">Colombia</option>
                                        <option value="Cộng hòa Congo">Cộng hòa Congo</option>
                                        <option value="Costa Rica">Costa Rica</option>
                                        <option value="Croatia">Croatia</option>
                                        <option value="Cuba">Cuba</option>
                                        <option value="Cộng hòa Séc">Cộng hòa Séc</option>
                                        <option value="Đan Mạch">Đan Mạch</option>
                                        <option value="Dominica">Dominica</option>
                                        <option value="Cộng hòa Dominica">Cộng hòa Dominica</option>
                                        <option value="Đông Timor">Đông Timor</option>
                                        <option value="Ecuador">Ecuador</option>
                                        <option value="El Salvador">El Salvador</option>
                                        <option value="Eritrea">Eritrea</option>
                                        <option value="Estonia">Estonia</option>
                                        <option value="Ethiopia">Ethiopia</option>
                                        <option value="Fiji">Fiji</option>
                                        <option value="Gabon">Gabon</option>
                                        <option value="Gambia">Gambia</option>
                                        <option value="Georgia">Georgia</option>
                                        <option value="Ghana">Ghana</option>
                                        <option value="Guatemala">Guatemala</option>
                                        <option value="Guinea">Guinea</option>
                                        <option value="Guinea Xích Đạo">Guinea Xích Đạo</option>
                                        <option value="Guinea-Bissau">Guinea-Bissau</option>
                                        <option value="Guyana">Guyana</option>
                                        <option value="Haiti">Haiti</option>
                                        <option value="Hà Lan">Hà Lan</option>
                                        <option value="Hàn Quốc">Hàn Quốc</option>
                                        <option value="Hoa Kỳ">Hoa Kỳ</option>
                                        <option value="Honduras">Honduras</option>
                                        <option value="Hungary">Hungary</option>
                                        <option value="Hy Lạp">Hy Lạp</option>
                                        <option value="Iceland">Iceland</option>
                                        <option value="Indonesia">Indonesia</option>
                                        <option value="Iran">Iran</option>
                                        <option value="Iraq">Iraq</option>
                                        <option value="Ireland">Ireland</option>
                                        <option value="Israel">Israel</option>
                                        <option value="Jamaica">Jamaica</option>
                                        <option value="Jordan">Jordan</option>
                                        <option value="Kazakhstan">Kazakhstan</option>
                                        <option value="Kenya">Kenya</option>
                                        <option value="Kiribati">Kiribati</option>
                                        <option value="Kosovo">Kosovo</option>
                                        <option value="Kuwait">Kuwait</option>
                                        <option value="Kyrgyzstan">Kyrgyzstan</option>
                                        <option value="Lào">Lào</option>
                                        <option value="Latvia">Latvia</option>
                                        <option value="Lesotho">Lesotho</option>
                                        <option value="Liban">Liban</option>
                                        <option value="Liberia">Liberia</option>
                                        <option value="Libya">Libya</option>
                                        <option value="Liechtenstein">Liechtenstein</option>
                                        <option value="Litva">Litva</option>
                                        <option value="Luxembourg">Luxembourg</option>
                                        <option value="Madagascar">Madagascar</option>
                                        <option value="Malaysia">Malaysia</option>
                                        <option value="Maldives">Maldives</option>
                                        <option value="Mali">Mali</option>
                                        <option value="Malta">Malta</option>
                                        <option value="Maroc">Maroc</option>
                                        <option value="Martinique">Martinique</option>
                                        <option value="Mauritania">Mauritania</option>
                                        <option value="Mauritius">Mauritius</option>
                                        <option value="Mayotte">Mayotte</option>
                                        <option value="Mexico">Mexico</option>
                                        <option value="Moldova">Moldova</option>
                                        <option value="Monaco">Monaco</option>
                                        <option value="Mông Cổ">Mông Cổ</option>
                                        <option value="Montenegro">Montenegro</option>
                                        <option value="Mozambique">Mozambique</option>
                                        <option value="Myanmar">Myanmar</option>
                                        <option value="Na Uy">Na Uy</option>
                                        <option value="Nam Phi">Nam Phi</option>
                                        <option value="Nam Sudan">Nam Sudan</option>
                                        <option value="Namibia">Namibia</option>
                                        <option value="Nepal">Nepal</option>
                                        <option value="New Zealand">New Zealand</option>
                                        <option value="Nhật Bản">Nhật Bản</option>
                                        <option value="Nicaragua">Nicaragua</option>
                                        <option value="Niger">Niger</option>
                                        <option value="Nigeria">Nigeria</option>
                                        <option value="Nga">Nga</option>
                                        <option value="Nhà nước Palestine">Nhà nước Palestine</option>
                                        <option value="Niger">Niger</option>
                                        <option value="Nigeria">Nigeria</option>
                                        <option value="Nga">Nga</option>
                                        <option value="Nhà nước Palestine">Nhà nước Palestine</option>
                                        <option value="Niger">Niger</option>
                                        <option value="Nigeria">Nigeria</option>
                                        <option value="Nga">Nga</option>
                                        <option value="Nhà nước Palestine">Nhà nước Palestine</option>
                                        <option value="Pakistan">Pakistan</option>
                                        <option value="Panama">Panama</option>
                                        <option value="Papua New Guinea">Papua New Guinea</option>
                                        <option value="Paraguay">Paraguay</option>
                                        <option value="Peru">Peru</option>
                                        <option value="Pháp">Pháp</option>
                                        <option value="Phần Lan">Phần Lan</option>
                                        <option value="Philippines">Philippines</option>
                                        <option value="Poland">Poland</option>
                                        <option value="Portugal">Portugal</option>
                                        <option value="Puerto Rico">Puerto Rico</option>
                                        <option value="Qatar">Qatar</option>
                                        <option value="Quần đảo Solomon">Quần đảo Solomon</option>
                                        <option value="Quần đảo Virgin thuộc Anh">Quần đảo Virgin thuộc Anh</option>
                                        <option value="Quần đảo Virgin thuộc Mỹ">Quần đảo Virgin thuộc Mỹ</option>
                                        <option value="Réunion">Réunion</option>
                                        <option value="Romania">Romania</option>
                                        <option value="Rwanda">Rwanda</option>
                                        <option value="Saint Kitts và Nevis">Saint Kitts và Nevis</option>
                                        <option value="Saint Lucia">Saint Lucia</option>
                                        <option value="Saint Vincent và Grenadines">Saint Vincent và Grenadines</option>
                                        <option value="Samoa">Samoa</option>
                                        <option value="San Marino">San Marino</option>
                                        <option value="São Tomé và Príncipe">São Tomé và Príncipe</option>
                                        <option value="Saudi Arabia">Saudi Arabia</option>
                                        <option value="Senegal">Senegal</option>
                                        <option value="Serbia">Serbia</option>
                                        <option value="Seychelles">Seychelles</option>
                                        <option value="Sierra Leone">Sierra Leone</option>
                                        <option value="Singapore">Singapore</option>
                                        <option value="Síp">Síp</option>
                                        <option value="Slovakia">Slovakia</option>
                                        <option value="Slovenia">Slovenia</option>
                                        <option value="Somalia">Somalia</option>
                                        <option value="Sri Lanka">Sri Lanka</option>
                                        <option value="Sudan">Sudan</option>
                                        <option value="Suriname">Suriname</option>
                                        <option value="Swaziland">Swaziland</option>
                                        <option value="Syria">Syria</option>
                                        <option value="Tajikistan">Tajikistan</option>
                                        <option value="Tanzania">Tanzania</option>
                                        <option value="Tây Ban Nha">Tây Ban Nha</option>
                                        <option value="Tchad">Tchad</option>
                                        <option value="Thái Lan">Thái Lan</option>
                                        <option value="Thổ Nhĩ Kỳ">Thổ Nhĩ Kỳ</option>
                                        <option value="Thụy Điển">Thụy Điển</option>
                                        <option value="Thụy Sĩ">Thụy Sĩ</option>
                                        <option value="Togo">Togo</option>
                                        <option value="Tonga">Tonga</option>
                                        <option value="Triều Tiên">Triều Tiên</option>
                                        <option value="Trinidad và Tobago">Trinidad và Tobago</option>
                                        <option value="Trung Quốc">Trung Quốc</option>
                                        <option value="Tunisia">Tunisia</option>
                                        <option value="Turkmenistan">Turkmenistan</option>
                                        <option value="Tuvalu">Tuvalu</option>
                                        <option value="Úc">Úc</option>
                                        <option value="Uganda">Uganda</option>
                                        <option value="Ukraine">Ukraine</option>
                                        <option value="Uruguay">Uruguay</option>
                                        <option value="Uzbekistan">Uzbekistan</option>
                                        <option value="Vanuatu">Vanuatu</option>
                                        <option value="Venezuela">Venezuela</option>
                                        <option value="Việt Nam">Việt Nam</option>
                                        <option value="Ý">Ý</option>
                                        <option value="Yemen">Yemen</option>
                                        <option value="Zambia">Zambia</option>
                                        <option value="Zimbabwe">Zimbabwe</option>
                                    </select>

                                </div>
                            </div>
                            <button type="submit" id="add-button">Add</button>
                        </form>
                    </div>
                </div><!-- .animated -->
            </div><!-- .content -->
            <div class="clearfix"></div>
        </div><!-- /#right-panel -->
        <!-- Right Panel -->
        <!-- Scripts -->
        <script src="assets/js/lib/chosen/chosen.jquery.min.js"></script>
        <script>
            jQuery(document).ready(function () {
                jQuery(".standardSelect").chosen({
                    disable_search_threshold: 10,
                    no_results_text: "Oops, nothing found!",
                    width: "100%"
                });
            });
        </script>

    </body>

</html>