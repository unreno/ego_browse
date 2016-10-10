
Noted oddities.
interviewId isn't always an INT.
active isn't always an INT.

```BASH
rails g scaffold AlterList studyId:integer name:text email:text ordering:integer interviewerId:integer  --no-migration --no-assets --no-fixture --no-jbuilder
rails g scaffold AlterPrompt studyId:integer afterAltersEntered:integer display:text --no-migration --no-assets --no-fixture --no-jbuilder
rails g scaffold Alter active:integer ordering:integer name:text interviewId:text alterListId:integer --no-migration --no-assets --no-fixture --no-jbuilder
rails g scaffold Answer active:integer questionId:integer interviewId:integer alterId1:integer alterId2:integer value:text otherSpecifyText:text skipReason:text studyId:integer questionType:text answerType:text --no-migration --no-assets --no-fixture --no-jbuilder
rails g scaffold AnswerList active:integer listName:text studyId:integer listOptionNames:text --no-migration --no-assets --no-fixture --no-jbuilder
rails g scaffold Expression active:integer name:text type:text operator:text value:text resultForUnanswered:boolean studyId:integer questionId:integer --no-migration --no-assets --no-fixture --no-jbuilder
rails g scaffold Graph interviewId:integer expressionId:integer nodes:text params:text --no-migration --no-assets --no-fixture --no-jbuilder
rails g scaffold Interview active:boolean studyId:integer completed:integer start_date:integer complete_date:integer --no-migration --no-assets --no-fixture --no-jbuilder
rails g scaffold Interviewers studyId:integer interviewerId:integer --no-migration --no-assets --no-fixture --no-jbuilder
rails g scaffold Legend studyId:integer questionId:integer shape:string label:string color:string size:integer ordering:integer --no-migration --no-assets --no-fixture --no-jbuilder
rails g scaffold MatchedAlter studyId:integer alterId1:integer alterId2:integer matchedName:string --no-migration --no-assets --no-fixture --no-jbuilder
rails g scaffold Note interviewId:integer expressionId:integer alterId:string notes:text --no-migration --no-assets --no-fixture --no-jbuilder
rails g scaffold OtherSpecify optionId:integer interviewId:integer value:string alterId:integer --no-migration --no-assets --no-fixture --no-jbuilder
rails g scaffold Question active:integer title:text prompt:text preface:text citation:text subjectType:text answerType:text askingStyleList:boolean ordering:integer otherSpecify:boolean noneButton:text allButton:text pageLevelDontKnowButton:text pageLevelRefuseButton:text dontKnowButton:boolean refuseButton:boolean allOptionString:text uselfExpression:text minLimitType:text minLiteral:integer minPrevQues:text maxLimitType:text maxLiteral:integer maxPrevQues:text minCheckableBoxes:integer maxCheckableBoxes:integer withListRange:integer listRangeString:text minListRange:integer maxListRange:integer timeUnits:integer symmetric:integer keepOnSamePage:integer studyId:integer answerReasonExpressionId:integer networkRelationshipExprId:integer networkParams:text networkNColorQId:integer networkNSizeQId:integer networkEColorQId:integer networkESizeQId:integer useAlterListField:text javascript:text --no-migration --no-assets --no-fixture --no-jbuilder
rails g scaffold QuestionOption active:integer studyId:integer questionId:integer name:text value:text ordering:integer otherSpecify:boolean --no-migration --no-assets --no-fixture --no-jbuilder
rails g scaffold Study active:integer name:text introduction:text egoIdPrompt:text alterPrompt:text conclusion:text minAlters:integer maxAlters:integer valueRefusal:integer valueDontKnow:integer valueLogicalSkip:integer valueNotYetAnswered:integer modified:datetime multiSessionEgoId:integer useAsAlters:boolean restrictAlters:boolean fillAlterList:boolean created_date:integer closed_date:integer status:integer userId:integer hideEgoIdPage:boolean style:text javascript:text footer:text --no-migration --no-assets --no-fixture --no-jbuilder
rails g scaffold User email:text password:text name:text lastActivity:datetime permissions:integer --no-migration --no-assets --no-fixture --no-jbuilder
```

