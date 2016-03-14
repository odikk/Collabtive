
{if $tasknum > 0}

    <div class="tasks" style = "padding-bottom:2px;">
        <div class="headline">
            <a href="javascript:void(0);" id="taskhead_toggle" class="win_none" onclick="changeElements('a.win_block','win_none');toggleBlock('taskhead');"></a>

            <div class="wintools">

                <div class="progress" id="progressdesktoptasks" style="display:none;width:22px;float:left">
                    <img src="templates/{$settings.template}/theme/{$settings.theme}/images/symbols/loader-tasks.gif"/>
                </div>
                <div class="export-main">


                    <a class="export"><span>{#export#}</span></a>
                    <div class="export-in" style="width:69px;left: -69px;"> {* at two items *}
                        <a class="rss" href="managerss.php?action=rss-tasks&user={$userid}"><span>{#rssfeed#}</span></a>
                        <!--<a class="ical" href="managetask.php?action=ical"><span>{#icalexport#}</span></a>-->
                        <a class="pdf" href="mytasks.php?action=pdf"><span>{#pdfexport#}</span></a>
                    </div>

                </div>

            </div>

            <h2><img src="./templates/{$settings.template}/theme/{$settings.theme}/images/symbols/tasklist.png" alt="" />{#mytasks#}</h2>
        </div>

        <div class = "acc_toggle"></div>
        <div class="block acc_content" id="taskhead" style = "overflow:hidden;" >
            <div id="form_addmytask" class="addmenue" style="display:none;">
                {include file="addmytask_index.tpl" }
            </div>

            <div class="nosmooth" id="sm_desktoptasks">

                <table id="desktoptasks" cellpadding="0" cellspacing="0" border="0" v-cloak>

                    <thead>
                    <tr>
                        <th class="a"></th>
                        <th class="b" style="cursor:pointer;" onclick="sortBlock('desktoptasks','');">{#task#}</th>
                        <th class="c" style="cursor:pointer;" onclick="sortBlock('desktoptasks','project');">{#project#}</th>
                        <th class="d" style="cursor:pointer;text-align:right" onclick="sortBlock('desktoptasks','daysleft');">{#daysleft#}&nbsp;&nbsp;</th>
                        <th class="tools"></th>
                    </tr>
                    </thead>

                    <tfoot>
                    <tr>
                        <td colspan="5"></td>
                    </tr>
                    </tfoot>



                    {*Color-Mix*}
                    {literal}
                    <tbody v-for="item in items" class="alternateColors" id="task_{{*item.ID}}" rel="{{*item.ID}},{{*item.title}},{{*item.daysleft}},
                    {{item.pname}}">

                        <tr v-bind:class="{ 'marker-late': item.islate, 'marker-today': item.istoday }" >
                            <td>
                                {/literal}{if $userpermissions.tasks.close}{literal}
                                    <a class="butn_check" href="javascript:closeElement('task_{{*item.ID}}','managetask.php?action=close&amp;tid={{*item.ID}}&amp;id={{*item.project}}');" title="{/literal}{#close#}"></a>
                                {/if}{literal}

                            </td>
                            <td>
                                <div class="toggle-in">
                                    <span id="desktoptaskstoggle{{item.ID}}" class="acc-toggle" onclick="javascript:accord_tasks.activate($$('#taskhead .accordion_toggle')[{{$index}}]);toggleAccordeon('taskhead',this);"></span>
                                    <a href="managetask.php?action=showtask&amp;id={{*item.project}}&amp;tid={{*item.ID}}" title="{{*item.title}}">
                                        {{item.title}}
                                    </a>
                                </div>
                            </td>
                            <td>
                                <a href="managetask.php?action=showproject&amp;id={{*item.project}}">{{*item.pname}}</a>
                            </td>
                            <td style="text-align:right">{{item.daysleft}}&nbsp;&nbsp;</td>
                            <td class="tools">

                                {/literal}{if $userpermissions.tasks.edit} {literal}
                                    <a class="tool_edit" href="javascript:void(0);" onclick="change('managetask.php?action=editform&amp;tid={{*item.ID}}&amp;id={{*item.project}}','form_addmytask');toggleClass(this,'tool_edit_active','tool_edit');blindtoggle('form_addmytask');"
                                       title="{/literal}{#edit#}"></a>
                                {/if}{literal}

                                {/literal}{if $userpermissions.tasks.del}{literal}
                                    <a class="tool_del" href="javascript:confirmfunction('{#confirmdel#}','deleteElement(\'task_{$tasks[task].ID}\',\'managetask.php?action=del&amp;tid={$tasks[task].ID}&amp;id={$tasks[task].project}\')');"  title="{/literal}{#delete#}"></a>
                                {/if}{literal}

                            </td>
                        </tr>

                        <tr class="acc">
                            <td colspan="5">
                                <div class="accordion_toggle"></div>
                                <div class="accordion_content">
                                    <div class="acc-in">
                                        <div class="message-in">
                                            {{{*item.text}}}
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tbody>

                </table>
                {/literal}

                <div class="tablemenue">
                    <div class="tablemenue-in">
                        {if $userpermissions.tasks.add}

                            <a class="butn_link" href="javascript:void(0);" id="add_butn_mytasks" onclick="blindtoggle('form_addmytask');toggleClass(this,'butn_link_active','butn_link');toggleClass('sm_desktoptasks','smooth','nosmooth');">{#addtask#}</a>
                        {/if}
                    </div>
                </div>
                <div class="content-spacer"></div>
            </div> {*block END*}
        </div> {* Smooth end *}
    </div> {*tasks END*}


{/if} {* Tasks END *}