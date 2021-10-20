<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp" %>



<div class="page-wrapper with-navbar with-navbar-fixed-bottom" data-sidebar-type="full-height overlayed-sm-and-down">
            <!-- Sticky alerts (toasts), empty container -->
            <!-- Reference: https://www.gethalfmoon.com/docs/sticky-alerts-toasts -->
            <div class="sticky-alerts"></div>

            <!-- Modals -->
            <!-- User unassign confirmation modal -->
            <div class="modal" id="modal-unassign" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <h5 class="modal-title">¿Desasignar usuario?</h5>
                        <p>
                            ¿Está seguro de querer desasignar a <span id="unassign-name-user">usuario</span> de la asignatura
                            <span id="unassign-name-course"></span>?
                        </p>
                        <div class="text-right mt-20">
                            <button class="btn mr-5" data-dismiss="modal" type="button">Cancelar</button>
                            <button class="btn btn-danger" data-dismiss="modal" type="button" onclick="unassignUser(this)">Desasignar</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Course deletion confirmation modal -->
            <div class="modal" id="modal-course-delete" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <h5 class="modal-title">¿Eliminar?</h5>
                        <p>
                            ¿Está seguro de querer eliminar la asignatura
                            <span id="course-delete-name-course"></span>?
                        </p>
                        <div class="text-right mt-20">
                            <button class="btn mr-5" data-dismiss="modal" type="button">Cancelar</button>
                            <button class="btn btn-danger" data-dismiss="modal" type="button" onclick="deleteCourse(this)">Eliminar</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Course creation modal -->
            <div class="modal" id="modal-create-course" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <h5 class="modal-title">Crear asignatura</h5>
                        <form>
                            <div class="form-group">
                                <label for="create-course-name" class="required">Nombre de la asignatura</label>
                                <input type="text" id="create-course-name" class="form-control" required="required" />
                            </div>
                            <div class="form-group">
                                <label for="create-course-description" class="required">Descripción</label>
                                <textarea id="create-course-description" class="form-control" required="required"></textarea>
                            </div>
                        </form>
                        <div class="text-right mt-20">
                            <button class="btn mr-5" data-dismiss="modal" type="button">Cancelar</button>
                            <button class="btn btn-primary" type="button" onclick="createCourse(this)">Crear asignatura</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- User assignation modal -->
            <div class="modal" id="modal-assign" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <h5 class="modal-title">Asignar usuario</h5>
                        <form>
                            <div class="form-group">
                                <label for="create-course-name" class="required">Usuario</label>
                                <select class="form-control" id="modal-assign-select" onclick="updateAssignUser(this)"></select>
                            </div>
                            <div class="form-group d-none" id="modal-assign-timetable">
                                <label class="required">Horario de tutorías</label>
                                <div class="text-center">
                                    <select class="form-control inline-block" id="modal-assign-timetable-day">
                                        <option id="Lunes">Lunes</option>
                                        <option id="Martes">Martes</option>
                                        <option id="Miercoles">Miercoles</option>
                                        <option id="Jueves">Jueves</option>
                                        <option id="Viernes">Viernes</option>
                                        <option id="Sábado">Sábado</option></select
                                    ><br />
                                    &nbsp;de&nbsp;
                                    <input
                                        type="number"
                                        id="modal-assign-timetable-hour1"
                                        class="w-50 form-control d-inline-block"
                                        min="0"
                                        max="24"
                                        value="13"
                                    />
                                    :
                                    <input
                                        type="number"
                                        id="modal-assign-timetable-minutes1"
                                        class="w-50 form-control d-inline-block"
                                        min="0"
                                        max="24"
                                        value="00"
                                    />
                                    &nbsp;a&nbsp;
                                    <input
                                        type="number"
                                        id="modal-assign-timetable-hour2"
                                        class="w-50 form-control d-inline-block"
                                        min="0"
                                        max="24"
                                        value="17"
                                    />
                                    :
                                    <input
                                        type="number"
                                        id="modal-assign-timetable-minutes2"
                                        class="w-50 form-control d-inline-block"
                                        min="0"
                                        max="24"
                                        value="30"
                                    />
                                    <br />en<br />
                                    <input type="text" id="modal-assign-timetable-location" class="form-control" value="Virtual" />
                                </div>
                            </div>
                        </form>
                        <div class="text-right mt-20">
                            <button class="btn mr-5" data-dismiss="modal" type="button">Cancelar</button>
                            <button class="btn btn-primary" type="button" onclick="assignUser(this)">Asignar usuario</button>
                        </div>
                    </div>
                </div>
            </div>






































<%@include file="footer.jsp" %>
