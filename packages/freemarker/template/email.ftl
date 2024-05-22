<div style="${style.emailWrapper}">
    <table align="center" cellpadding="0" cellspacing="0" style="width: 100%;">
      <tr>
        <td style="padding-top: 20px"><img src="https://joyy-weibo.oss-cn-shenzhen.aliyuncs.com/portal74e4c889ed1709092067111.png" style="width: 113px; height: 27px;" /></td>
      </tr>
      <tr>
        <td style="padding: 10px 0 12px; font-size: 16px;color: #101010;">${emailText}</td>
      </tr>
    </table>
    <table align="center" cellpadding="0" cellspacing="0" style="width: 100%">
        <tbody>
            <tr>
                <td>
                    <div style="padding:0px">
                        <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#fff" style="border-radius:5px;background-color:#fff;border:1px solid #e9e9e9">
                            <tbody>
                                <tr style="box-sizing:border-box;font-size:14px;margin:0">
                                    <td style="font-size:15px;text-align:center;padding:20px 0 0 0">${date}
                                        <br>
                                        <table width="100%" cellpadding="0" cellspacing="0">
                                            <tbody>
                                                <tr>
                                                    <#-- 流程名称 -->
                                                    <td valign="top" align="center" style="${style.emailTitle}">${flowDescription}</td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table cellpadding="0" cellspacing="0" style="text-align:left;width:100%;padding:0 20px 0 20px">
                                                            <tbody>
                                                                <tr>
                                                                    <td style="padding-bottom:10px">
                                                                        <p>You have been requested to review the following:</p>
                                                                        <p></p>
                                                                        <table cellpadding="0" cellspacing="0" style="width:100%">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <#-- 申请人 -->
                                                                                    <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.employee.text}</td>
                                                                                    <td style="${style.emailBaseInfoColumnValue}">${entity.employeeText}</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <#-- 工号 -->
                                                                                    <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.employeeCode.text}</td>
                                                                                    <td style="${style.emailBaseInfoColumnValue}">${entity.employeeCode}</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <#-- 申请人部门 -->
                                                                                    <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.department.text}</td>
                                                                                    <td style="${style.emailBaseInfoColumnValue}">${entity.departmentText}</td>
                                                                                </tr>

                                                                                <#if entity.flowTitle?? && entity.flowTitle !=''>
                                                                                    <tr>
                                                                                        <#-- 流程标题 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.flowTitle.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.flowTitle}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.string21?? && entity.string21 !=''>
                                                                                    <tr>
                                                                                        <#-- 流水号 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string21.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string21}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.string22?? && entity.string22 !=''>
                                                                                    <tr>
                                                                                        <#-- 归档流水号 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string22.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string22}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.string8Text?? && entity.string8Text !=''>
                                                                                    <tr>
                                                                                        <#-- 支付方式 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string8.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string8Text}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.companyText?? && entity.companyText !=''>
                                                                                    <tr>
                                                                                        <#-- 所属公司 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.company.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.companyText}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.string27Text?? && entity.string27Text !=''>
                                                                                    <tr>
                                                                                        <#-- 预算中心 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string27.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string27Text}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.string38Text?? && entity.string38Text !=''>
                                                                                    <tr>
                                                                                        <#-- 关联预算使用流程 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string38.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}"><a href="${href}" target="_blank">${entity.string38Text}</a></td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.string31?? && entity.string31 !=''>
                                                                                    <tr>
                                                                                        <#-- 付款银行账号 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string31.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string31}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                
                                                                                <#if entity.string41Text?? && entity.string41Text !=''>
                                                                                    <tr>
                                                                                        <#-- 收方银行地区 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string41.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string41Text}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.string28?? && entity.string28 !=''>
                                                                                    <tr>
                                                                                        <#-- 收款方银行开户行 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string28.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string28}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.string32?? && entity.string32 !=''>
                                                                                    <tr>
                                                                                        <#-- 收款方联行号 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string32.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string32}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.string3Text?? && entity.string3Text !=''>
                                                                                    <tr>
                                                                                        <#-- 所属省 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string3.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string3Text}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.string4Text?? && entity.string4Text !=''>
                                                                                    <tr>
                                                                                        <#-- 所属市 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string4.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string4Text}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.string2Text?? && entity.string2Text !=''>
                                                                                    <tr>
                                                                                        <#-- 所属银行 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string2.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string2Text}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.string42Text?? && entity.string42Text !=''>
                                                                                    <tr>
                                                                                        <#-- LOCAL BANK CODE -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string42.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string42Text}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.string9?? && entity.string9 !=''>
                                                                                    <tr>
                                                                                        <#-- SWIFT CODE -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string9.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string9}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.string10?? && entity.string10 !=''>
                                                                                    <tr>
                                                                                        <#-- BANK INSTITUTION NAME -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string10.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string10}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.string45?? && entity.string45 !=''>
                                                                                    <tr>
                                                                                        <#-- BANK CODE -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string45.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string45}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.string46Text?? && entity.string46Text !=''>
                                                                                    <tr>
                                                                                        <#-- 银行名称 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string46.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string46Text}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.string47Text?? && entity.string47Text !=''>
                                                                                    <tr>
                                                                                        <#-- 分行名称 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string47.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string47Text}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.string12Text?? && entity.string12Text !=''>
                                                                                    <tr>
                                                                                        <#-- 手续费承担 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string12.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string12Text}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                            
                                                                                <#if entity.string1?? && entity.string1 !=''>
                                                                                    <tr>
                                                                                        <#-- 工资卡号 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string1.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string1}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.string11?? && entity.string11 !=''>
                                                                                    <tr>
                                                                                        <#-- 账户名 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string11.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string11}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.string5?? && entity.string5 !=''>
                                                                                    <tr>
                                                                                        <#-- 联系电话 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string5.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string5}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.string7Text?? && entity.string7Text !=''>
                                                                                    <tr>
                                                                                        <#-- 货币类型 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string7.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string7Text}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.bigDecimal2??>
                                                                                    <tr>
                                                                                        <#-- 汇率 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.bigDecimal2.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.bigDecimal2}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.bigDecimal3??>
                                                                                    <tr>
                                                                                        <#-- 合计 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.bigDecimal3.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.bigDecimal3}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.bigDecimal10??>
                                                                                    <tr>
                                                                                        <#-- 人民币合计 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.bigDecimal10.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.bigDecimal10}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.bigDecimal27??>
                                                                                    <tr>
                                                                                        <#-- 清借支 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.bigDecimal27.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.bigDecimal27}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.bigDecimal28??>
                                                                                    <tr>
                                                                                        <#-- 员工退还 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.bigDecimal28.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.bigDecimal28}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.bigDecimal29??>
                                                                                    <tr>
                                                                                        <#-- 应支付员工 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.bigDecimal29.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.bigDecimal29}</td>
                                                                                    </tr>
                                                                                </#if>
                                                                                <#if entity.string20?? && entity.string20 !=''>
                                                                                    <tr>
                                                                                        <#-- 备注 -->
                                                                                        <td style="${style.emailBaseInfoColumnLabel}">${fieldDefinition.string20.text}</td>
                                                                                        <td style="${style.emailBaseInfoColumnValue}">${entity.string20}</td>
                                                                                    </tr>
                                                                                </#if>

                                                                                <#-- 附件 -->
                                                                                <#if workflowAttechmentGroups?? && workflowAttechmentGroups?has_content>
                                                                                    <#list workflowAttechmentGroups as workflowAttechmentGroup>
                                                                                        <#if workflowAttechmentGroup.attachmentTypeText?? && workflowAttechmentGroup.attachmentTypeText !=''>
                                                                                            <tr>
                                                                                                <td style="${style.emailBaseInfoColumnLabel}">${workflowAttechmentGroup.attachmentTypeText}</td>
                                                                                                <td style="${style.emailBaseInfoColumnValue}">
                                                                                                    <#list workflowAttechmentGroup.list as attechment>
                                                                                                        <a href="${href}" target="_blank">${attechment.name}</a>
                                                                                                        <br>
                                                                                                    </#list>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </#if>
                                                                                    </#list>
                                                                                </#if>
                                                                                <tr>
                                                                                    <td colspan="2" style="${style.emailBaseInfoColumnValue}"></td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>

                                                                        <p></p>
                                                                        <#-- 子表 -->
                                                                        <#if childTable?? && childTable.datas?? && childTable.datas?has_content>
                                                                            <p>${fieldDefinition.childTable.text}</p>
                                                                            <div style="max-width: 700px;overflow-x: auto;">
                                                                                <table cellpadding="6px">
                                                                                    <thead>
                                                                                        <tr>
                                                                                            <#list childTable.header as childHeader>
                                                                                                <th style="font-weight: normal;color: #7a8499;min-width: 100px;vertical-align:top;line-height: 18px;">${childHeader}</th>
                                                                                            </#list>
                                                                                        </tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                        <#list childTable.datas as childData>
                                                                                            <tr>
                                                                                                <#if childData.date1??>
                                                                                                    <#-- 日期 -->
                                                                                                    <td style="min-width: 100px;vertical-align:top;line-height: 18px;">${childData.date1}</td>
                                                                                                </#if>
                                                                                                <#if childData.string6??>
                                                                                                    <#-- 用途及解释 -->
                                                                                                    <td style="min-width: 100px;vertical-align:top;line-height: 18px;">${childData.string6}</td>
                                                                                                </#if>
                                                                                                <#if childData.string30Text??>
                                                                                                    <#-- 费用类型 -->
                                                                                                    <td style="min-width: 100px;vertical-align:top;line-height: 18px;">${childData.string30Text}</td>
                                                                                                </#if>
                                                                                                <#if childData.string31Text??>
                                                                                                    <#-- 二级分类 -->
                                                                                                    <td style="min-width: 100px;vertical-align:top;line-height: 18px;">${childData.string31Text}</td>
                                                                                                </#if>
                                                                                                <#if childData.bigDecimal1??>
                                                                                                    <#-- 金额 -->
                                                                                                    <td style="min-width: 100px;vertical-align:top;line-height: 18px;">${childData.bigDecimal1}</td>
                                                                                                </#if>
                                                                                            </tr>
                                                                                        </#list>
                                                                                        <tr>
                                                                                            <td colspan="${childTable.header?size}" style="box-sizing:border-box;vertical-align:top;border-top-width:1px;border-top-color:#f4f4f4;border-top-style:solid;margin:0;padding:5px 0 0 10px;min-width:130px">
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </#if>

                                                                        <p></p>
                                                                        <table width="100%" cellpadding="0" cellspacing="0" bgcolor="#fff" style="background-color:#fff;border:1px dashed #e9e9e9;padding:15px 8px">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td>
                                                                                        <table width="100%" style="padding-bottom:8px">
                                                                                            <tbody>
                                                                                                <tr>
                                                                                                    <td style="font-weight:500;font-size:18px">Approval steps</td>
                                                                                                    <td style="padding:0 0 0 5px">
                                                                                                        <div style="text-align:right">
                                                                                                            <#-- 流程当前状态 -->
                                                                                                            <span style="color:${workflowState.color};background-color:${workflowState.backgroundColor};padding:3px 7px 3px 7px;border-radius:7px">${workflowState.statusText}</span>
                                                                                                        </div>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </tbody>
                                                                                        </table>
                                                                                        <table width="100%">
                                                                                            <tbody>
                                                                                                <#-- 审批历史 -->
                                                                                                <#list workflowHistorySteps as step>
                                                                                                    <tr>
                                                                                                        <td style="${style.emailStepColumn};min-width: 150px;">${step.operation}</td>
                                                                                                        <td style="${style.emailStepColumn};min-width: 180px;">${step.stepName}</td>
                                                                                                        <td style="${style.emailStepColumn};min-width: 180px;">${step.auditor}</td>
                                                                                                        <tr>
                                                                                                            <td colspan="3" style="${style.emailStepDetail};color:${style.colorGray}">${step.auditMemo}</td>
                                                                                                        </tr>
                                                                                                    </tr>
                                                                                                </#list>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                        <p></p>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <br>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table width="100%">
                                            <tbody>
                                                <tr>
                                                    <td style="text-align:center;padding-bottom:20px">
                                                        <#-- 操作按钮 -->
                                                        <#list operations as operation>
                                                            <a href="${operation.href}" style="min-height:25px;white-space:nowrap;background:white;padding:10px 10px 6px 10px;text-align:center;border-radius:3px;border:1px solid black;color:black;font-weight:normal;text-decoration:none;display:inline-block;margin-bottom:5px;min-width:100px" target="_blank">${operation.text}</a>
                                                        </#list>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br>
                        <table width="100%" cellpadding="0" cellspacing="0" style="box-sizing:border-box;font-size:13px;padding:0 5px;text-align:center;color:#767676">
                            <tbody>
                                <tr>
                                    <td>${warnTips}</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    <div class="yj6qo">
    </div>
    <div class="adL">
    </div>
</div>