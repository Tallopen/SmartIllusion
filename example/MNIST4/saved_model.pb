п╝
╩Ъ
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( И
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
Ы
Conv2D

input"T
filter"T
output"T"
Ttype:	
2"
strides	list(int)"
use_cudnn_on_gpubool(",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 "-
data_formatstringNHWC:
NHWCNCHW" 
	dilations	list(int)

√
FusedBatchNormV3
x"T

scale"U
offset"U	
mean"U
variance"U
y"T

batch_mean"U
batch_variance"U
reserve_space_1"U
reserve_space_2"U
reserve_space_3"U"
Ttype:
2"
Utype:
2"
epsilonfloat%╖╤8"&
exponential_avg_factorfloat%  А?";
data_formatstringNHWC:
NHWCNCHWNDHWCNCDHW"
is_trainingbool(
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
В
MaxPool

input"T
output"T"
Ttype0:
2	"
ksize	list(int)(0"
strides	list(int)(0",
paddingstring:
SAMEVALIDEXPLICIT""
explicit_paddings	list(int)
 ":
data_formatstringNHWC:
NHWCNCHWNCHW_VECT_C
Ж
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool("
allow_missing_filesbool( И
?
Mul
x"T
y"T
z"T"
Ttype:
2	Р

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetypeИ
E
Relu
features"T
activations"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
Щ
ResizeNearestNeighbor
images"T
size
resized_images"T"
Ttype:
2
	"
align_cornersbool( "
half_pixel_centersbool( 
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0И
?
Select
	condition

t"T
e"T
output"T"	
Ttype
P
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	
H
ShardedFilename
basename	
shard

num_shards
filename
┴
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring Ии
@
StaticRegexFullMatch	
input

output
"
patternstring
ў
StridedSlice

input"T
begin"Index
end"Index
strides"Index
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint 
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
-
Tanh
x"T
y"T"
Ttype:

2
Ц
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 И"serve*2.10.02v2.10.0-rc3-6-g359c3cdfc5f8┐╢
l

conv7/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_name
conv7/bias
e
conv7/bias/Read/ReadVariableOpReadVariableOp
conv7/bias*
_output_shapes
:*
dtype0
|
conv7/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_nameconv7/kernel
u
 conv7/kernel/Read/ReadVariableOpReadVariableOpconv7/kernel*&
_output_shapes
:*
dtype0
l

conv6/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_name
conv6/bias
e
conv6/bias/Read/ReadVariableOpReadVariableOp
conv6/bias*
_output_shapes
:*
dtype0
|
conv6/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*
shared_nameconv6/kernel
u
 conv6/kernel/Read/ReadVariableOpReadVariableOpconv6/kernel*&
_output_shapes
:@*
dtype0
l

conv5/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*
shared_name
conv5/bias
e
conv5/bias/Read/ReadVariableOpReadVariableOp
conv5/bias*
_output_shapes
:@*
dtype0
|
conv5/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*
shared_nameconv5/kernel
u
 conv5/kernel/Read/ReadVariableOpReadVariableOpconv5/kernel*&
_output_shapes
:@*
dtype0
y
outputLayer/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:И*!
shared_nameoutputLayer/bias
r
$outputLayer/bias/Read/ReadVariableOpReadVariableOpoutputLayer/bias*
_output_shapes	
:И*
dtype0
Б
outputLayer/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	@И*#
shared_nameoutputLayer/kernel
z
&outputLayer/kernel/Read/ReadVariableOpReadVariableOpoutputLayer/kernel*
_output_shapes
:	@И*
dtype0
z
decodeLayer1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*"
shared_namedecodeLayer1/bias
s
%decodeLayer1/bias/Read/ReadVariableOpReadVariableOpdecodeLayer1/bias*
_output_shapes
:@*
dtype0
В
decodeLayer1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*$
shared_namedecodeLayer1/kernel
{
'decodeLayer1/kernel/Read/ReadVariableOpReadVariableOpdecodeLayer1/kernel*
_output_shapes

:@*
dtype0
l

dense/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_name
dense/bias
e
dense/bias/Read/ReadVariableOpReadVariableOp
dense/bias*
_output_shapes
:*
dtype0
t
dense/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@*
shared_namedense/kernel
m
 dense/kernel/Read/ReadVariableOpReadVariableOpdense/kernel*
_output_shapes

:@*
dtype0
n
dense1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*
shared_namedense1/bias
g
dense1/bias/Read/ReadVariableOpReadVariableOpdense1/bias*
_output_shapes
:@*
dtype0
w
dense1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	а@*
shared_namedense1/kernel
p
!dense1/kernel/Read/ReadVariableOpReadVariableOpdense1/kernel*
_output_shapes
:	а@*
dtype0
l

conv2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
conv2/bias
e
conv2/bias/Read/ReadVariableOpReadVariableOp
conv2/bias*
_output_shapes
: *
dtype0
|
conv2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameconv2/kernel
u
 conv2/kernel/Read/ReadVariableOpReadVariableOpconv2/kernel*&
_output_shapes
: *
dtype0
Ю
#batch_normalization/moving_varianceVarHandleOp*
_output_shapes
: *
dtype0*
shape:*4
shared_name%#batch_normalization/moving_variance
Ч
7batch_normalization/moving_variance/Read/ReadVariableOpReadVariableOp#batch_normalization/moving_variance*
_output_shapes
:*
dtype0
Ц
batch_normalization/moving_meanVarHandleOp*
_output_shapes
: *
dtype0*
shape:*0
shared_name!batch_normalization/moving_mean
П
3batch_normalization/moving_mean/Read/ReadVariableOpReadVariableOpbatch_normalization/moving_mean*
_output_shapes
:*
dtype0
И
batch_normalization/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*)
shared_namebatch_normalization/beta
Б
,batch_normalization/beta/Read/ReadVariableOpReadVariableOpbatch_normalization/beta*
_output_shapes
:*
dtype0
К
batch_normalization/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:**
shared_namebatch_normalization/gamma
Г
-batch_normalization/gamma/Read/ReadVariableOpReadVariableOpbatch_normalization/gamma*
_output_shapes
:*
dtype0
l

conv1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_name
conv1/bias
e
conv1/bias/Read/ReadVariableOpReadVariableOp
conv1/bias*
_output_shapes
:*
dtype0
|
conv1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_nameconv1/kernel
u
 conv1/kernel/Read/ReadVariableOpReadVariableOpconv1/kernel*&
_output_shapes
:*
dtype0
К
serving_default_input_1Placeholder*/
_output_shapes
:         *
dtype0*$
shape:         
ч
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_1conv1/kernel
conv1/biasbatch_normalization/gammabatch_normalization/betabatch_normalization/moving_mean#batch_normalization/moving_varianceconv2/kernel
conv2/biasdense1/kerneldense1/biasdense/kernel
dense/biasdecodeLayer1/kerneldecodeLayer1/biasoutputLayer/kerneloutputLayer/biasconv5/kernel
conv5/biasconv6/kernel
conv6/biasconv7/kernel
conv7/bias*"
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:         *8
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8В *-
f(R&
$__inference_signature_wrapper_350948

NoOpNoOp
рw
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*Ыw
valueСwBОw BЗw
╫
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
encoder
	decoder


signatures*
к
0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
 21*
Ъ
0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
 19*
* 
░
!non_trainable_variables

"layers
#metrics
$layer_regularization_losses
%layer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
6
&trace_0
'trace_1
(trace_2
)trace_3* 
6
*trace_0
+trace_1
,trace_2
-trace_3* 
* 
З
.layer_with_weights-0
.layer-0
/layer_with_weights-1
/layer-1
0layer-2
1layer_with_weights-2
1layer-3
2layer-4
3layer-5
4layer_with_weights-3
4layer-6
5layer-7
6layer_with_weights-4
6layer-8
7	variables
8trainable_variables
9regularization_losses
:	keras_api
;__call__
*<&call_and_return_all_conditional_losses*
З
=layer_with_weights-0
=layer-0
>layer-1
?layer_with_weights-1
?layer-2
@layer-3
Alayer-4
Blayer_with_weights-2
Blayer-5
Clayer-6
Dlayer_with_weights-3
Dlayer-7
Elayer_with_weights-4
Elayer-8
F	variables
Gtrainable_variables
Hregularization_losses
I	keras_api
J__call__
*K&call_and_return_all_conditional_losses*

Lserving_default* 
LF
VARIABLE_VALUEconv1/kernel&variables/0/.ATTRIBUTES/VARIABLE_VALUE*
JD
VARIABLE_VALUE
conv1/bias&variables/1/.ATTRIBUTES/VARIABLE_VALUE*
YS
VARIABLE_VALUEbatch_normalization/gamma&variables/2/.ATTRIBUTES/VARIABLE_VALUE*
XR
VARIABLE_VALUEbatch_normalization/beta&variables/3/.ATTRIBUTES/VARIABLE_VALUE*
_Y
VARIABLE_VALUEbatch_normalization/moving_mean&variables/4/.ATTRIBUTES/VARIABLE_VALUE*
c]
VARIABLE_VALUE#batch_normalization/moving_variance&variables/5/.ATTRIBUTES/VARIABLE_VALUE*
LF
VARIABLE_VALUEconv2/kernel&variables/6/.ATTRIBUTES/VARIABLE_VALUE*
JD
VARIABLE_VALUE
conv2/bias&variables/7/.ATTRIBUTES/VARIABLE_VALUE*
MG
VARIABLE_VALUEdense1/kernel&variables/8/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUEdense1/bias&variables/9/.ATTRIBUTES/VARIABLE_VALUE*
MG
VARIABLE_VALUEdense/kernel'variables/10/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUE
dense/bias'variables/11/.ATTRIBUTES/VARIABLE_VALUE*
TN
VARIABLE_VALUEdecodeLayer1/kernel'variables/12/.ATTRIBUTES/VARIABLE_VALUE*
RL
VARIABLE_VALUEdecodeLayer1/bias'variables/13/.ATTRIBUTES/VARIABLE_VALUE*
SM
VARIABLE_VALUEoutputLayer/kernel'variables/14/.ATTRIBUTES/VARIABLE_VALUE*
QK
VARIABLE_VALUEoutputLayer/bias'variables/15/.ATTRIBUTES/VARIABLE_VALUE*
MG
VARIABLE_VALUEconv5/kernel'variables/16/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUE
conv5/bias'variables/17/.ATTRIBUTES/VARIABLE_VALUE*
MG
VARIABLE_VALUEconv6/kernel'variables/18/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUE
conv6/bias'variables/19/.ATTRIBUTES/VARIABLE_VALUE*
MG
VARIABLE_VALUEconv7/kernel'variables/20/.ATTRIBUTES/VARIABLE_VALUE*
KE
VARIABLE_VALUE
conv7/bias'variables/21/.ATTRIBUTES/VARIABLE_VALUE*

0
1*

0
	1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
╚
M	variables
Ntrainable_variables
Oregularization_losses
P	keras_api
Q__call__
*R&call_and_return_all_conditional_losses

kernel
bias
 S_jit_compiled_convolution_op*
╒
T	variables
Utrainable_variables
Vregularization_losses
W	keras_api
X__call__
*Y&call_and_return_all_conditional_losses
Zaxis
	gamma
beta
moving_mean
moving_variance*
О
[	variables
\trainable_variables
]regularization_losses
^	keras_api
___call__
*`&call_and_return_all_conditional_losses* 
╚
a	variables
btrainable_variables
cregularization_losses
d	keras_api
e__call__
*f&call_and_return_all_conditional_losses

kernel
bias
 g_jit_compiled_convolution_op*
О
h	variables
itrainable_variables
jregularization_losses
k	keras_api
l__call__
*m&call_and_return_all_conditional_losses* 
О
n	variables
otrainable_variables
pregularization_losses
q	keras_api
r__call__
*s&call_and_return_all_conditional_losses* 
ж
t	variables
utrainable_variables
vregularization_losses
w	keras_api
x__call__
*y&call_and_return_all_conditional_losses

kernel
bias*
ж
z	variables
{trainable_variables
|regularization_losses
}	keras_api
~__call__
*&call_and_return_all_conditional_losses
А_random_generator* 
м
Б	variables
Вtrainable_variables
Гregularization_losses
Д	keras_api
Е__call__
+Ж&call_and_return_all_conditional_losses

kernel
bias*
Z
0
1
2
3
4
5
6
7
8
9
10
11*
J
0
1
2
3
4
5
6
7
8
9*
* 
Ш
Зnon_trainable_variables
Иlayers
Йmetrics
 Кlayer_regularization_losses
Лlayer_metrics
7	variables
8trainable_variables
9regularization_losses
;__call__
*<&call_and_return_all_conditional_losses
&<"call_and_return_conditional_losses*
:
Мtrace_0
Нtrace_1
Оtrace_2
Пtrace_3* 
:
Рtrace_0
Сtrace_1
Тtrace_2
Уtrace_3* 
м
Ф	variables
Хtrainable_variables
Цregularization_losses
Ч	keras_api
Ш__call__
+Щ&call_and_return_all_conditional_losses

kernel
bias*
м
Ъ	variables
Ыtrainable_variables
Ьregularization_losses
Э	keras_api
Ю__call__
+Я&call_and_return_all_conditional_losses
а_random_generator* 
м
б	variables
вtrainable_variables
гregularization_losses
д	keras_api
е__call__
+ж&call_and_return_all_conditional_losses

kernel
bias*
Ф
з	variables
иtrainable_variables
йregularization_losses
к	keras_api
л__call__
+м&call_and_return_all_conditional_losses* 
Ф
н	variables
оtrainable_variables
пregularization_losses
░	keras_api
▒__call__
+▓&call_and_return_all_conditional_losses* 
╧
│	variables
┤trainable_variables
╡regularization_losses
╢	keras_api
╖__call__
+╕&call_and_return_all_conditional_losses

kernel
bias
!╣_jit_compiled_convolution_op*
Ф
║	variables
╗trainable_variables
╝regularization_losses
╜	keras_api
╛__call__
+┐&call_and_return_all_conditional_losses* 
╧
└	variables
┴trainable_variables
┬regularization_losses
├	keras_api
─__call__
+┼&call_and_return_all_conditional_losses

kernel
bias
!╞_jit_compiled_convolution_op*
╧
╟	variables
╚trainable_variables
╔regularization_losses
╩	keras_api
╦__call__
+╠&call_and_return_all_conditional_losses

kernel
 bias
!═_jit_compiled_convolution_op*
J
0
1
2
3
4
5
6
7
8
 9*
J
0
1
2
3
4
5
6
7
8
 9*
* 
Ш
╬non_trainable_variables
╧layers
╨metrics
 ╤layer_regularization_losses
╥layer_metrics
F	variables
Gtrainable_variables
Hregularization_losses
J__call__
*K&call_and_return_all_conditional_losses
&K"call_and_return_conditional_losses*
:
╙trace_0
╘trace_1
╒trace_2
╓trace_3* 
:
╫trace_0
╪trace_1
┘trace_2
┌trace_3* 
* 

0
1*

0
1*
* 
Ш
█non_trainable_variables
▄layers
▌metrics
 ▐layer_regularization_losses
▀layer_metrics
M	variables
Ntrainable_variables
Oregularization_losses
Q__call__
*R&call_and_return_all_conditional_losses
&R"call_and_return_conditional_losses*

рtrace_0* 

сtrace_0* 
* 
 
0
1
2
3*

0
1*
* 
Ш
тnon_trainable_variables
уlayers
фmetrics
 хlayer_regularization_losses
цlayer_metrics
T	variables
Utrainable_variables
Vregularization_losses
X__call__
*Y&call_and_return_all_conditional_losses
&Y"call_and_return_conditional_losses*

чtrace_0
шtrace_1* 

щtrace_0
ъtrace_1* 
* 
* 
* 
* 
Ц
ыnon_trainable_variables
ьlayers
эmetrics
 юlayer_regularization_losses
яlayer_metrics
[	variables
\trainable_variables
]regularization_losses
___call__
*`&call_and_return_all_conditional_losses
&`"call_and_return_conditional_losses* 

Ёtrace_0* 

ёtrace_0* 

0
1*

0
1*
* 
Ш
Єnon_trainable_variables
єlayers
Їmetrics
 їlayer_regularization_losses
Ўlayer_metrics
a	variables
btrainable_variables
cregularization_losses
e__call__
*f&call_and_return_all_conditional_losses
&f"call_and_return_conditional_losses*

ўtrace_0* 

°trace_0* 
* 
* 
* 
* 
Ц
∙non_trainable_variables
·layers
√metrics
 №layer_regularization_losses
¤layer_metrics
h	variables
itrainable_variables
jregularization_losses
l__call__
*m&call_and_return_all_conditional_losses
&m"call_and_return_conditional_losses* 

■trace_0* 

 trace_0* 
* 
* 
* 
Ц
Аnon_trainable_variables
Бlayers
Вmetrics
 Гlayer_regularization_losses
Дlayer_metrics
n	variables
otrainable_variables
pregularization_losses
r__call__
*s&call_and_return_all_conditional_losses
&s"call_and_return_conditional_losses* 

Еtrace_0* 

Жtrace_0* 

0
1*

0
1*
* 
Ш
Зnon_trainable_variables
Иlayers
Йmetrics
 Кlayer_regularization_losses
Лlayer_metrics
t	variables
utrainable_variables
vregularization_losses
x__call__
*y&call_and_return_all_conditional_losses
&y"call_and_return_conditional_losses*

Мtrace_0* 

Нtrace_0* 
* 
* 
* 
Ц
Оnon_trainable_variables
Пlayers
Рmetrics
 Сlayer_regularization_losses
Тlayer_metrics
z	variables
{trainable_variables
|regularization_losses
~__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses* 

Уtrace_0
Фtrace_1* 

Хtrace_0
Цtrace_1* 
* 

0
1*

0
1*
* 
Ю
Чnon_trainable_variables
Шlayers
Щmetrics
 Ъlayer_regularization_losses
Ыlayer_metrics
Б	variables
Вtrainable_variables
Гregularization_losses
Е__call__
+Ж&call_and_return_all_conditional_losses
'Ж"call_and_return_conditional_losses*

Ьtrace_0* 

Эtrace_0* 

0
1*
C
.0
/1
02
13
24
35
46
57
68*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

0
1*

0
1*
* 
Ю
Юnon_trainable_variables
Яlayers
аmetrics
 бlayer_regularization_losses
вlayer_metrics
Ф	variables
Хtrainable_variables
Цregularization_losses
Ш__call__
+Щ&call_and_return_all_conditional_losses
'Щ"call_and_return_conditional_losses*

гtrace_0* 

дtrace_0* 
* 
* 
* 
Ь
еnon_trainable_variables
жlayers
зmetrics
 иlayer_regularization_losses
йlayer_metrics
Ъ	variables
Ыtrainable_variables
Ьregularization_losses
Ю__call__
+Я&call_and_return_all_conditional_losses
'Я"call_and_return_conditional_losses* 

кtrace_0
лtrace_1* 

мtrace_0
нtrace_1* 
* 

0
1*

0
1*
* 
Ю
оnon_trainable_variables
пlayers
░metrics
 ▒layer_regularization_losses
▓layer_metrics
б	variables
вtrainable_variables
гregularization_losses
е__call__
+ж&call_and_return_all_conditional_losses
'ж"call_and_return_conditional_losses*

│trace_0* 

┤trace_0* 
* 
* 
* 
Ь
╡non_trainable_variables
╢layers
╖metrics
 ╕layer_regularization_losses
╣layer_metrics
з	variables
иtrainable_variables
йregularization_losses
л__call__
+м&call_and_return_all_conditional_losses
'м"call_and_return_conditional_losses* 

║trace_0* 

╗trace_0* 
* 
* 
* 
Ь
╝non_trainable_variables
╜layers
╛metrics
 ┐layer_regularization_losses
└layer_metrics
н	variables
оtrainable_variables
пregularization_losses
▒__call__
+▓&call_and_return_all_conditional_losses
'▓"call_and_return_conditional_losses* 

┴trace_0* 

┬trace_0* 

0
1*

0
1*
* 
Ю
├non_trainable_variables
─layers
┼metrics
 ╞layer_regularization_losses
╟layer_metrics
│	variables
┤trainable_variables
╡regularization_losses
╖__call__
+╕&call_and_return_all_conditional_losses
'╕"call_and_return_conditional_losses*

╚trace_0* 

╔trace_0* 
* 
* 
* 
* 
Ь
╩non_trainable_variables
╦layers
╠metrics
 ═layer_regularization_losses
╬layer_metrics
║	variables
╗trainable_variables
╝regularization_losses
╛__call__
+┐&call_and_return_all_conditional_losses
'┐"call_and_return_conditional_losses* 

╧trace_0* 

╨trace_0* 

0
1*

0
1*
* 
Ю
╤non_trainable_variables
╥layers
╙metrics
 ╘layer_regularization_losses
╒layer_metrics
└	variables
┴trainable_variables
┬regularization_losses
─__call__
+┼&call_and_return_all_conditional_losses
'┼"call_and_return_conditional_losses*

╓trace_0* 

╫trace_0* 
* 

0
 1*

0
 1*
* 
Ю
╪non_trainable_variables
┘layers
┌metrics
 █layer_regularization_losses
▄layer_metrics
╟	variables
╚trainable_variables
╔regularization_losses
╦__call__
+╠&call_and_return_all_conditional_losses
'╠"call_and_return_conditional_losses*

▌trace_0* 

▐trace_0* 
* 
* 
C
=0
>1
?2
@3
A4
B5
C6
D7
E8*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 

0
1*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
ъ
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename conv1/kernel/Read/ReadVariableOpconv1/bias/Read/ReadVariableOp-batch_normalization/gamma/Read/ReadVariableOp,batch_normalization/beta/Read/ReadVariableOp3batch_normalization/moving_mean/Read/ReadVariableOp7batch_normalization/moving_variance/Read/ReadVariableOp conv2/kernel/Read/ReadVariableOpconv2/bias/Read/ReadVariableOp!dense1/kernel/Read/ReadVariableOpdense1/bias/Read/ReadVariableOp dense/kernel/Read/ReadVariableOpdense/bias/Read/ReadVariableOp'decodeLayer1/kernel/Read/ReadVariableOp%decodeLayer1/bias/Read/ReadVariableOp&outputLayer/kernel/Read/ReadVariableOp$outputLayer/bias/Read/ReadVariableOp conv5/kernel/Read/ReadVariableOpconv5/bias/Read/ReadVariableOp conv6/kernel/Read/ReadVariableOpconv6/bias/Read/ReadVariableOp conv7/kernel/Read/ReadVariableOpconv7/bias/Read/ReadVariableOpConst*#
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *(
f#R!
__inference__traced_save_352079
н
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenameconv1/kernel
conv1/biasbatch_normalization/gammabatch_normalization/betabatch_normalization/moving_mean#batch_normalization/moving_varianceconv2/kernel
conv2/biasdense1/kerneldense1/biasdense/kernel
dense/biasdecodeLayer1/kerneldecodeLayer1/biasoutputLayer/kerneloutputLayer/biasconv5/kernel
conv5/biasconv6/kernel
conv6/biasconv7/kernel
conv7/bias*"
Tin
2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *+
f&R$
"__inference__traced_restore_352155Д 
н)
ш
F__inference_sequential_layer_call_and_return_conditional_losses_350067
conv1_input&
conv1_350033:
conv1_350035:(
batch_normalization_350038:(
batch_normalization_350040:(
batch_normalization_350042:(
batch_normalization_350044:&
conv2_350048: 
conv2_350050:  
dense1_350055:	а@
dense1_350057:@
dense_350061:@
dense_350063:
identityИв+batch_normalization/StatefulPartitionedCallвconv1/StatefulPartitionedCallвconv2/StatefulPartitionedCallвdense/StatefulPartitionedCallвdense1/StatefulPartitionedCallв!predense2/StatefulPartitionedCallё
conv1/StatefulPartitionedCallStatefulPartitionedCallconv1_inputconv1_350033conv1_350035*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv1_layer_call_and_return_conditional_losses_349689■
+batch_normalization/StatefulPartitionedCallStatefulPartitionedCall&conv1/StatefulPartitionedCall:output:0batch_normalization_350038batch_normalization_350040batch_normalization_350042batch_normalization_350044*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *X
fSRQ
O__inference_batch_normalization_layer_call_and_return_conditional_losses_349636ш
pool1/PartitionedCallPartitionedCall4batch_normalization/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:         * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_pool1_layer_call_and_return_conditional_losses_349656Д
conv2/StatefulPartitionedCallStatefulPartitionedCallpool1/PartitionedCall:output:0conv2_350048conv2_350050*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:          *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv2_layer_call_and_return_conditional_losses_349716┌
pool2/PartitionedCallPartitionedCall&conv2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:          * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_pool2_layer_call_and_return_conditional_losses_349668╙
predense1/PartitionedCallPartitionedCallpool2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         а* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_predense1_layer_call_and_return_conditional_losses_349729Д
dense1/StatefulPartitionedCallStatefulPartitionedCall"predense1/PartitionedCall:output:0dense1_350055dense1_350057*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense1_layer_call_and_return_conditional_losses_349742ы
!predense2/StatefulPartitionedCallStatefulPartitionedCall'dense1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_predense2_layer_call_and_return_conditional_losses_349830И
dense/StatefulPartitionedCallStatefulPartitionedCall*predense2/StatefulPartitionedCall:output:0dense_350061dense_350063*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_dense_layer_call_and_return_conditional_losses_349766u
IdentityIdentity&dense/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         Щ
NoOpNoOp,^batch_normalization/StatefulPartitionedCall^conv1/StatefulPartitionedCall^conv2/StatefulPartitionedCall^dense/StatefulPartitionedCall^dense1/StatefulPartitionedCall"^predense2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*F
_input_shapes5
3:         : : : : : : : : : : : : 2Z
+batch_normalization/StatefulPartitionedCall+batch_normalization/StatefulPartitionedCall2>
conv1/StatefulPartitionedCallconv1/StatefulPartitionedCall2>
conv2/StatefulPartitionedCallconv2/StatefulPartitionedCall2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2@
dense1/StatefulPartitionedCalldense1/StatefulPartitionedCall2F
!predense2/StatefulPartitionedCall!predense2/StatefulPartitionedCall:\ X
/
_output_shapes
:         
%
_user_specified_nameconv1_input
ў
█
)__inference_ae_mnist_layer_call_fn_351046
x!
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:#
	unknown_5: 
	unknown_6: 
	unknown_7:	а@
	unknown_8:@
	unknown_9:@

unknown_10:

unknown_11:@

unknown_12:@

unknown_13:	@И

unknown_14:	И$

unknown_15:@

unknown_16:@$

unknown_17:@

unknown_18:$

unknown_19:

unknown_20:
identityИвStatefulPartitionedCall√
StatefulPartitionedCallStatefulPartitionedCallxunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20*"
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *6
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8В *M
fHRF
D__inference_ae_mnist_layer_call_and_return_conditional_losses_350701Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+                           `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*Z
_input_shapesI
G:         : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:R N
/
_output_shapes
:         

_user_specified_namex
╓
a
C__inference_dropout_layer_call_and_return_conditional_losses_351845

inputs

identity_1N
IdentityIdentityinputs*
T0*'
_output_shapes
:         @[

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:         @"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:         @:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
є	
d
E__inference_predense2_layer_call_and_return_conditional_losses_351790

inputs
identityИR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  а?d
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:         @C
dropout/ShapeShapeinputs*
T0*
_output_shapes
:М
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:         @*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *═╠L>ж
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:         @o
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:         @i
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*'
_output_shapes
:         @Y
IdentityIdentitydropout/Mul_1:z:0*
T0*'
_output_shapes
:         @"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:         @:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
Ф
h
L__inference_upSamplingLayer3_layer_call_and_return_conditional_losses_351950

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:╜
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:V
ConstConst*
_output_shapes
:*
dtype0*
valueB"      W
mulMulstrided_slice:output:0Const:output:0*
T0*
_output_shapes
:╡
resize/ResizeNearestNeighborResizeNearestNeighborinputsmul:z:0*
T0*J
_output_shapes8
6:4                                    *
half_pixel_centers(Ш
IdentityIdentity-resize/ResizeNearestNeighbor:resized_images:0*
T0*J
_output_shapes8
6:4                                    "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4                                    :r n
J
_output_shapes8
6:4                                    
 
_user_specified_nameinputs
Д
╛
O__inference_batch_normalization_layer_call_and_return_conditional_losses_349636

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identityИвAssignNewValueвAssignNewValue_1вFusedBatchNormV3/ReadVariableOpв!FusedBatchNormV3/ReadVariableOp_1вReadVariableOpвReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0Д
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0И
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0╓
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+                           :::::*
epsilon%oГ:*
exponential_avg_factor%
╫#<╞
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0*
validate_shape(╨
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0*
validate_shape(}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+                           ╘
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+                           : : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+                           
 
_user_specified_nameinputs
Й
]
A__inference_pool1_layer_call_and_return_conditional_losses_349656

inputs
identityв
MaxPoolMaxPoolinputs*J
_output_shapes8
6:4                                    *
ksize
*
paddingVALID*
strides
{
IdentityIdentityMaxPool:output:0*
T0*J
_output_shapes8
6:4                                    "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4                                    :r n
J
_output_shapes8
6:4                                    
 
_user_specified_nameinputs
Ф
h
L__inference_upSamplingLayer2_layer_call_and_return_conditional_losses_351913

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:╜
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:V
ConstConst*
_output_shapes
:*
dtype0*
valueB"      W
mulMulstrided_slice:output:0Const:output:0*
T0*
_output_shapes
:╡
resize/ResizeNearestNeighborResizeNearestNeighborinputsmul:z:0*
T0*J
_output_shapes8
6:4                                    *
half_pixel_centers(Ш
IdentityIdentity-resize/ResizeNearestNeighbor:resized_images:0*
T0*J
_output_shapes8
6:4                                    "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4                                    :r n
J
_output_shapes8
6:4                                    
 
_user_specified_nameinputs
Н
Ш
-__inference_sequential_1_layer_call_fn_350246
decodelayer1_input
unknown:@
	unknown_0:@
	unknown_1:	@И
	unknown_2:	И#
	unknown_3:@
	unknown_4:@#
	unknown_5:@
	unknown_6:#
	unknown_7:
	unknown_8:
identityИвStatefulPartitionedCallы
StatefulPartitionedCallStatefulPartitionedCalldecodelayer1_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_sequential_1_layer_call_and_return_conditional_losses_350223Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+                           `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':         : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
'
_output_shapes
:         
,
_user_specified_namedecodeLayer1_input
Я

∙
H__inference_decodeLayer1_layer_call_and_return_conditional_losses_350123

inputs0
matmul_readvariableop_resource:@-
biasadd_readvariableop_resource:@
identityИвBiasAdd/ReadVariableOpвMatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:         @a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:         @w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:         : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
А
·
A__inference_conv1_layer_call_and_return_conditional_losses_351630

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identityИвBiasAdd/ReadVariableOpвConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Щ
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:         *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:         X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:         i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:         w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:         : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:         
 
_user_specified_nameinputs
°'
┐
F__inference_sequential_layer_call_and_return_conditional_losses_349773

inputs&
conv1_349690:
conv1_349692:(
batch_normalization_349695:(
batch_normalization_349697:(
batch_normalization_349699:(
batch_normalization_349701:&
conv2_349717: 
conv2_349719:  
dense1_349743:	а@
dense1_349745:@
dense_349767:@
dense_349769:
identityИв+batch_normalization/StatefulPartitionedCallвconv1/StatefulPartitionedCallвconv2/StatefulPartitionedCallвdense/StatefulPartitionedCallвdense1/StatefulPartitionedCallь
conv1/StatefulPartitionedCallStatefulPartitionedCallinputsconv1_349690conv1_349692*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv1_layer_call_and_return_conditional_losses_349689А
+batch_normalization/StatefulPartitionedCallStatefulPartitionedCall&conv1/StatefulPartitionedCall:output:0batch_normalization_349695batch_normalization_349697batch_normalization_349699batch_normalization_349701*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:         *&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *X
fSRQ
O__inference_batch_normalization_layer_call_and_return_conditional_losses_349605ш
pool1/PartitionedCallPartitionedCall4batch_normalization/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:         * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_pool1_layer_call_and_return_conditional_losses_349656Д
conv2/StatefulPartitionedCallStatefulPartitionedCallpool1/PartitionedCall:output:0conv2_349717conv2_349719*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:          *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv2_layer_call_and_return_conditional_losses_349716┌
pool2/PartitionedCallPartitionedCall&conv2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:          * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_pool2_layer_call_and_return_conditional_losses_349668╙
predense1/PartitionedCallPartitionedCallpool2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         а* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_predense1_layer_call_and_return_conditional_losses_349729Д
dense1/StatefulPartitionedCallStatefulPartitionedCall"predense1/PartitionedCall:output:0dense1_349743dense1_349745*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense1_layer_call_and_return_conditional_losses_349742█
predense2/PartitionedCallPartitionedCall'dense1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_predense2_layer_call_and_return_conditional_losses_349753А
dense/StatefulPartitionedCallStatefulPartitionedCall"predense2/PartitionedCall:output:0dense_349767dense_349769*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_dense_layer_call_and_return_conditional_losses_349766u
IdentityIdentity&dense/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         ї
NoOpNoOp,^batch_normalization/StatefulPartitionedCall^conv1/StatefulPartitionedCall^conv2/StatefulPartitionedCall^dense/StatefulPartitionedCall^dense1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*F
_input_shapes5
3:         : : : : : : : : : : : : 2Z
+batch_normalization/StatefulPartitionedCall+batch_normalization/StatefulPartitionedCall2>
conv1/StatefulPartitionedCallconv1/StatefulPartitionedCall2>
conv2/StatefulPartitionedCallconv2/StatefulPartitionedCall2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2@
dense1/StatefulPartitionedCalldense1/StatefulPartitionedCall:W S
/
_output_shapes
:         
 
_user_specified_nameinputs
┐з
В
!__inference__wrapped_model_349583
input_1R
8ae_mnist_sequential_conv1_conv2d_readvariableop_resource:G
9ae_mnist_sequential_conv1_biasadd_readvariableop_resource:M
?ae_mnist_sequential_batch_normalization_readvariableop_resource:O
Aae_mnist_sequential_batch_normalization_readvariableop_1_resource:^
Pae_mnist_sequential_batch_normalization_fusedbatchnormv3_readvariableop_resource:`
Rae_mnist_sequential_batch_normalization_fusedbatchnormv3_readvariableop_1_resource:R
8ae_mnist_sequential_conv2_conv2d_readvariableop_resource: G
9ae_mnist_sequential_conv2_biasadd_readvariableop_resource: L
9ae_mnist_sequential_dense1_matmul_readvariableop_resource:	а@H
:ae_mnist_sequential_dense1_biasadd_readvariableop_resource:@J
8ae_mnist_sequential_dense_matmul_readvariableop_resource:@G
9ae_mnist_sequential_dense_biasadd_readvariableop_resource:S
Aae_mnist_sequential_1_decodelayer1_matmul_readvariableop_resource:@P
Bae_mnist_sequential_1_decodelayer1_biasadd_readvariableop_resource:@S
@ae_mnist_sequential_1_outputlayer_matmul_readvariableop_resource:	@ИP
Aae_mnist_sequential_1_outputlayer_biasadd_readvariableop_resource:	ИT
:ae_mnist_sequential_1_conv5_conv2d_readvariableop_resource:@I
;ae_mnist_sequential_1_conv5_biasadd_readvariableop_resource:@T
:ae_mnist_sequential_1_conv6_conv2d_readvariableop_resource:@I
;ae_mnist_sequential_1_conv6_biasadd_readvariableop_resource:T
:ae_mnist_sequential_1_conv7_conv2d_readvariableop_resource:I
;ae_mnist_sequential_1_conv7_biasadd_readvariableop_resource:
identityИвGae_mnist/sequential/batch_normalization/FusedBatchNormV3/ReadVariableOpвIae_mnist/sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp_1в6ae_mnist/sequential/batch_normalization/ReadVariableOpв8ae_mnist/sequential/batch_normalization/ReadVariableOp_1в0ae_mnist/sequential/conv1/BiasAdd/ReadVariableOpв/ae_mnist/sequential/conv1/Conv2D/ReadVariableOpв0ae_mnist/sequential/conv2/BiasAdd/ReadVariableOpв/ae_mnist/sequential/conv2/Conv2D/ReadVariableOpв0ae_mnist/sequential/dense/BiasAdd/ReadVariableOpв/ae_mnist/sequential/dense/MatMul/ReadVariableOpв1ae_mnist/sequential/dense1/BiasAdd/ReadVariableOpв0ae_mnist/sequential/dense1/MatMul/ReadVariableOpв2ae_mnist/sequential_1/conv5/BiasAdd/ReadVariableOpв1ae_mnist/sequential_1/conv5/Conv2D/ReadVariableOpв2ae_mnist/sequential_1/conv6/BiasAdd/ReadVariableOpв1ae_mnist/sequential_1/conv6/Conv2D/ReadVariableOpв2ae_mnist/sequential_1/conv7/BiasAdd/ReadVariableOpв1ae_mnist/sequential_1/conv7/Conv2D/ReadVariableOpв9ae_mnist/sequential_1/decodeLayer1/BiasAdd/ReadVariableOpв8ae_mnist/sequential_1/decodeLayer1/MatMul/ReadVariableOpв8ae_mnist/sequential_1/outputLayer/BiasAdd/ReadVariableOpв7ae_mnist/sequential_1/outputLayer/MatMul/ReadVariableOp░
/ae_mnist/sequential/conv1/Conv2D/ReadVariableOpReadVariableOp8ae_mnist_sequential_conv1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0╬
 ae_mnist/sequential/conv1/Conv2DConv2Dinput_17ae_mnist/sequential/conv1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:         *
paddingSAME*
strides
ж
0ae_mnist/sequential/conv1/BiasAdd/ReadVariableOpReadVariableOp9ae_mnist_sequential_conv1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0╦
!ae_mnist/sequential/conv1/BiasAddBiasAdd)ae_mnist/sequential/conv1/Conv2D:output:08ae_mnist/sequential/conv1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:         М
ae_mnist/sequential/conv1/ReluRelu*ae_mnist/sequential/conv1/BiasAdd:output:0*
T0*/
_output_shapes
:         ▓
6ae_mnist/sequential/batch_normalization/ReadVariableOpReadVariableOp?ae_mnist_sequential_batch_normalization_readvariableop_resource*
_output_shapes
:*
dtype0╢
8ae_mnist/sequential/batch_normalization/ReadVariableOp_1ReadVariableOpAae_mnist_sequential_batch_normalization_readvariableop_1_resource*
_output_shapes
:*
dtype0╘
Gae_mnist/sequential/batch_normalization/FusedBatchNormV3/ReadVariableOpReadVariableOpPae_mnist_sequential_batch_normalization_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0╪
Iae_mnist/sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpRae_mnist_sequential_batch_normalization_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0д
8ae_mnist/sequential/batch_normalization/FusedBatchNormV3FusedBatchNormV3,ae_mnist/sequential/conv1/Relu:activations:0>ae_mnist/sequential/batch_normalization/ReadVariableOp:value:0@ae_mnist/sequential/batch_normalization/ReadVariableOp_1:value:0Oae_mnist/sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp:value:0Qae_mnist/sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:         :::::*
epsilon%oГ:*
is_training( ╫
!ae_mnist/sequential/pool1/MaxPoolMaxPool<ae_mnist/sequential/batch_normalization/FusedBatchNormV3:y:0*/
_output_shapes
:         *
ksize
*
paddingVALID*
strides
░
/ae_mnist/sequential/conv2/Conv2D/ReadVariableOpReadVariableOp8ae_mnist_sequential_conv2_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0ё
 ae_mnist/sequential/conv2/Conv2DConv2D*ae_mnist/sequential/pool1/MaxPool:output:07ae_mnist/sequential/conv2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:          *
paddingSAME*
strides
ж
0ae_mnist/sequential/conv2/BiasAdd/ReadVariableOpReadVariableOp9ae_mnist_sequential_conv2_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0╦
!ae_mnist/sequential/conv2/BiasAddBiasAdd)ae_mnist/sequential/conv2/Conv2D:output:08ae_mnist/sequential/conv2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:          М
ae_mnist/sequential/conv2/ReluRelu*ae_mnist/sequential/conv2/BiasAdd:output:0*
T0*/
_output_shapes
:          ╟
!ae_mnist/sequential/pool2/MaxPoolMaxPool,ae_mnist/sequential/conv2/Relu:activations:0*/
_output_shapes
:          *
ksize
*
paddingVALID*
strides
t
#ae_mnist/sequential/predense1/ConstConst*
_output_shapes
:*
dtype0*
valueB"       ╜
%ae_mnist/sequential/predense1/ReshapeReshape*ae_mnist/sequential/pool2/MaxPool:output:0,ae_mnist/sequential/predense1/Const:output:0*
T0*(
_output_shapes
:         ал
0ae_mnist/sequential/dense1/MatMul/ReadVariableOpReadVariableOp9ae_mnist_sequential_dense1_matmul_readvariableop_resource*
_output_shapes
:	а@*
dtype0╟
!ae_mnist/sequential/dense1/MatMulMatMul.ae_mnist/sequential/predense1/Reshape:output:08ae_mnist/sequential/dense1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @и
1ae_mnist/sequential/dense1/BiasAdd/ReadVariableOpReadVariableOp:ae_mnist_sequential_dense1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0╟
"ae_mnist/sequential/dense1/BiasAddBiasAdd+ae_mnist/sequential/dense1/MatMul:product:09ae_mnist/sequential/dense1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @Ж
ae_mnist/sequential/dense1/ReluRelu+ae_mnist/sequential/dense1/BiasAdd:output:0*
T0*'
_output_shapes
:         @У
&ae_mnist/sequential/predense2/IdentityIdentity-ae_mnist/sequential/dense1/Relu:activations:0*
T0*'
_output_shapes
:         @и
/ae_mnist/sequential/dense/MatMul/ReadVariableOpReadVariableOp8ae_mnist_sequential_dense_matmul_readvariableop_resource*
_output_shapes

:@*
dtype0╞
 ae_mnist/sequential/dense/MatMulMatMul/ae_mnist/sequential/predense2/Identity:output:07ae_mnist/sequential/dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         ж
0ae_mnist/sequential/dense/BiasAdd/ReadVariableOpReadVariableOp9ae_mnist_sequential_dense_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0─
!ae_mnist/sequential/dense/BiasAddBiasAdd*ae_mnist/sequential/dense/MatMul:product:08ae_mnist/sequential/dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         Д
ae_mnist/sequential/dense/TanhTanh*ae_mnist/sequential/dense/BiasAdd:output:0*
T0*'
_output_shapes
:         ║
8ae_mnist/sequential_1/decodeLayer1/MatMul/ReadVariableOpReadVariableOpAae_mnist_sequential_1_decodelayer1_matmul_readvariableop_resource*
_output_shapes

:@*
dtype0╦
)ae_mnist/sequential_1/decodeLayer1/MatMulMatMul"ae_mnist/sequential/dense/Tanh:y:0@ae_mnist/sequential_1/decodeLayer1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @╕
9ae_mnist/sequential_1/decodeLayer1/BiasAdd/ReadVariableOpReadVariableOpBae_mnist_sequential_1_decodelayer1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0▀
*ae_mnist/sequential_1/decodeLayer1/BiasAddBiasAdd3ae_mnist/sequential_1/decodeLayer1/MatMul:product:0Aae_mnist/sequential_1/decodeLayer1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @Ц
'ae_mnist/sequential_1/decodeLayer1/ReluRelu3ae_mnist/sequential_1/decodeLayer1/BiasAdd:output:0*
T0*'
_output_shapes
:         @Ы
&ae_mnist/sequential_1/dropout/IdentityIdentity5ae_mnist/sequential_1/decodeLayer1/Relu:activations:0*
T0*'
_output_shapes
:         @╣
7ae_mnist/sequential_1/outputLayer/MatMul/ReadVariableOpReadVariableOp@ae_mnist_sequential_1_outputlayer_matmul_readvariableop_resource*
_output_shapes
:	@И*
dtype0╫
(ae_mnist/sequential_1/outputLayer/MatMulMatMul/ae_mnist/sequential_1/dropout/Identity:output:0?ae_mnist/sequential_1/outputLayer/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:         И╖
8ae_mnist/sequential_1/outputLayer/BiasAdd/ReadVariableOpReadVariableOpAae_mnist_sequential_1_outputlayer_biasadd_readvariableop_resource*
_output_shapes	
:И*
dtype0▌
)ae_mnist/sequential_1/outputLayer/BiasAddBiasAdd2ae_mnist/sequential_1/outputLayer/MatMul:product:0@ae_mnist/sequential_1/outputLayer/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ИХ
&ae_mnist/sequential_1/outputLayer/ReluRelu2ae_mnist/sequential_1/outputLayer/BiasAdd:output:0*
T0*(
_output_shapes
:         ИМ
(ae_mnist/sequential_1/reshapeLayer/ShapeShape4ae_mnist/sequential_1/outputLayer/Relu:activations:0*
T0*
_output_shapes
:А
6ae_mnist/sequential_1/reshapeLayer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: В
8ae_mnist/sequential_1/reshapeLayer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:В
8ae_mnist/sequential_1/reshapeLayer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:А
0ae_mnist/sequential_1/reshapeLayer/strided_sliceStridedSlice1ae_mnist/sequential_1/reshapeLayer/Shape:output:0?ae_mnist/sequential_1/reshapeLayer/strided_slice/stack:output:0Aae_mnist/sequential_1/reshapeLayer/strided_slice/stack_1:output:0Aae_mnist/sequential_1/reshapeLayer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskt
2ae_mnist/sequential_1/reshapeLayer/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :t
2ae_mnist/sequential_1/reshapeLayer/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :t
2ae_mnist/sequential_1/reshapeLayer/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :╪
0ae_mnist/sequential_1/reshapeLayer/Reshape/shapePack9ae_mnist/sequential_1/reshapeLayer/strided_slice:output:0;ae_mnist/sequential_1/reshapeLayer/Reshape/shape/1:output:0;ae_mnist/sequential_1/reshapeLayer/Reshape/shape/2:output:0;ae_mnist/sequential_1/reshapeLayer/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:р
*ae_mnist/sequential_1/reshapeLayer/ReshapeReshape4ae_mnist/sequential_1/outputLayer/Relu:activations:09ae_mnist/sequential_1/reshapeLayer/Reshape/shape:output:0*
T0*/
_output_shapes
:         }
,ae_mnist/sequential_1/upSamplingLayer2/ConstConst*
_output_shapes
:*
dtype0*
valueB"      
.ae_mnist/sequential_1/upSamplingLayer2/Const_1Const*
_output_shapes
:*
dtype0*
valueB"      ╞
*ae_mnist/sequential_1/upSamplingLayer2/mulMul5ae_mnist/sequential_1/upSamplingLayer2/Const:output:07ae_mnist/sequential_1/upSamplingLayer2/Const_1:output:0*
T0*
_output_shapes
:Х
Cae_mnist/sequential_1/upSamplingLayer2/resize/ResizeNearestNeighborResizeNearestNeighbor3ae_mnist/sequential_1/reshapeLayer/Reshape:output:0.ae_mnist/sequential_1/upSamplingLayer2/mul:z:0*
T0*/
_output_shapes
:         *
half_pixel_centers(┤
1ae_mnist/sequential_1/conv5/Conv2D/ReadVariableOpReadVariableOp:ae_mnist_sequential_1_conv5_conv2d_readvariableop_resource*&
_output_shapes
:@*
dtype0Я
"ae_mnist/sequential_1/conv5/Conv2DConv2DTae_mnist/sequential_1/upSamplingLayer2/resize/ResizeNearestNeighbor:resized_images:09ae_mnist/sequential_1/conv5/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:         @*
paddingSAME*
strides
к
2ae_mnist/sequential_1/conv5/BiasAdd/ReadVariableOpReadVariableOp;ae_mnist_sequential_1_conv5_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0╤
#ae_mnist/sequential_1/conv5/BiasAddBiasAdd+ae_mnist/sequential_1/conv5/Conv2D:output:0:ae_mnist/sequential_1/conv5/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:         @Р
 ae_mnist/sequential_1/conv5/ReluRelu,ae_mnist/sequential_1/conv5/BiasAdd:output:0*
T0*/
_output_shapes
:         @}
,ae_mnist/sequential_1/upSamplingLayer3/ConstConst*
_output_shapes
:*
dtype0*
valueB"      
.ae_mnist/sequential_1/upSamplingLayer3/Const_1Const*
_output_shapes
:*
dtype0*
valueB"      ╞
*ae_mnist/sequential_1/upSamplingLayer3/mulMul5ae_mnist/sequential_1/upSamplingLayer3/Const:output:07ae_mnist/sequential_1/upSamplingLayer3/Const_1:output:0*
T0*
_output_shapes
:Р
Cae_mnist/sequential_1/upSamplingLayer3/resize/ResizeNearestNeighborResizeNearestNeighbor.ae_mnist/sequential_1/conv5/Relu:activations:0.ae_mnist/sequential_1/upSamplingLayer3/mul:z:0*
T0*/
_output_shapes
:         @*
half_pixel_centers(┤
1ae_mnist/sequential_1/conv6/Conv2D/ReadVariableOpReadVariableOp:ae_mnist_sequential_1_conv6_conv2d_readvariableop_resource*&
_output_shapes
:@*
dtype0Я
"ae_mnist/sequential_1/conv6/Conv2DConv2DTae_mnist/sequential_1/upSamplingLayer3/resize/ResizeNearestNeighbor:resized_images:09ae_mnist/sequential_1/conv6/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:         *
paddingSAME*
strides
к
2ae_mnist/sequential_1/conv6/BiasAdd/ReadVariableOpReadVariableOp;ae_mnist_sequential_1_conv6_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0╤
#ae_mnist/sequential_1/conv6/BiasAddBiasAdd+ae_mnist/sequential_1/conv6/Conv2D:output:0:ae_mnist/sequential_1/conv6/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:         Р
 ae_mnist/sequential_1/conv6/ReluRelu,ae_mnist/sequential_1/conv6/BiasAdd:output:0*
T0*/
_output_shapes
:         ┤
1ae_mnist/sequential_1/conv7/Conv2D/ReadVariableOpReadVariableOp:ae_mnist_sequential_1_conv7_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0∙
"ae_mnist/sequential_1/conv7/Conv2DConv2D.ae_mnist/sequential_1/conv6/Relu:activations:09ae_mnist/sequential_1/conv7/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:         *
paddingSAME*
strides
к
2ae_mnist/sequential_1/conv7/BiasAdd/ReadVariableOpReadVariableOp;ae_mnist_sequential_1_conv7_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0╤
#ae_mnist/sequential_1/conv7/BiasAddBiasAdd+ae_mnist/sequential_1/conv7/Conv2D:output:0:ae_mnist/sequential_1/conv7/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:         Р
 ae_mnist/sequential_1/conv7/ReluRelu,ae_mnist/sequential_1/conv7/BiasAdd:output:0*
T0*/
_output_shapes
:         Е
IdentityIdentity.ae_mnist/sequential_1/conv7/Relu:activations:0^NoOp*
T0*/
_output_shapes
:         Н

NoOpNoOpH^ae_mnist/sequential/batch_normalization/FusedBatchNormV3/ReadVariableOpJ^ae_mnist/sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp_17^ae_mnist/sequential/batch_normalization/ReadVariableOp9^ae_mnist/sequential/batch_normalization/ReadVariableOp_11^ae_mnist/sequential/conv1/BiasAdd/ReadVariableOp0^ae_mnist/sequential/conv1/Conv2D/ReadVariableOp1^ae_mnist/sequential/conv2/BiasAdd/ReadVariableOp0^ae_mnist/sequential/conv2/Conv2D/ReadVariableOp1^ae_mnist/sequential/dense/BiasAdd/ReadVariableOp0^ae_mnist/sequential/dense/MatMul/ReadVariableOp2^ae_mnist/sequential/dense1/BiasAdd/ReadVariableOp1^ae_mnist/sequential/dense1/MatMul/ReadVariableOp3^ae_mnist/sequential_1/conv5/BiasAdd/ReadVariableOp2^ae_mnist/sequential_1/conv5/Conv2D/ReadVariableOp3^ae_mnist/sequential_1/conv6/BiasAdd/ReadVariableOp2^ae_mnist/sequential_1/conv6/Conv2D/ReadVariableOp3^ae_mnist/sequential_1/conv7/BiasAdd/ReadVariableOp2^ae_mnist/sequential_1/conv7/Conv2D/ReadVariableOp:^ae_mnist/sequential_1/decodeLayer1/BiasAdd/ReadVariableOp9^ae_mnist/sequential_1/decodeLayer1/MatMul/ReadVariableOp9^ae_mnist/sequential_1/outputLayer/BiasAdd/ReadVariableOp8^ae_mnist/sequential_1/outputLayer/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*Z
_input_shapesI
G:         : : : : : : : : : : : : : : : : : : : : : : 2Т
Gae_mnist/sequential/batch_normalization/FusedBatchNormV3/ReadVariableOpGae_mnist/sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp2Ц
Iae_mnist/sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp_1Iae_mnist/sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp_12p
6ae_mnist/sequential/batch_normalization/ReadVariableOp6ae_mnist/sequential/batch_normalization/ReadVariableOp2t
8ae_mnist/sequential/batch_normalization/ReadVariableOp_18ae_mnist/sequential/batch_normalization/ReadVariableOp_12d
0ae_mnist/sequential/conv1/BiasAdd/ReadVariableOp0ae_mnist/sequential/conv1/BiasAdd/ReadVariableOp2b
/ae_mnist/sequential/conv1/Conv2D/ReadVariableOp/ae_mnist/sequential/conv1/Conv2D/ReadVariableOp2d
0ae_mnist/sequential/conv2/BiasAdd/ReadVariableOp0ae_mnist/sequential/conv2/BiasAdd/ReadVariableOp2b
/ae_mnist/sequential/conv2/Conv2D/ReadVariableOp/ae_mnist/sequential/conv2/Conv2D/ReadVariableOp2d
0ae_mnist/sequential/dense/BiasAdd/ReadVariableOp0ae_mnist/sequential/dense/BiasAdd/ReadVariableOp2b
/ae_mnist/sequential/dense/MatMul/ReadVariableOp/ae_mnist/sequential/dense/MatMul/ReadVariableOp2f
1ae_mnist/sequential/dense1/BiasAdd/ReadVariableOp1ae_mnist/sequential/dense1/BiasAdd/ReadVariableOp2d
0ae_mnist/sequential/dense1/MatMul/ReadVariableOp0ae_mnist/sequential/dense1/MatMul/ReadVariableOp2h
2ae_mnist/sequential_1/conv5/BiasAdd/ReadVariableOp2ae_mnist/sequential_1/conv5/BiasAdd/ReadVariableOp2f
1ae_mnist/sequential_1/conv5/Conv2D/ReadVariableOp1ae_mnist/sequential_1/conv5/Conv2D/ReadVariableOp2h
2ae_mnist/sequential_1/conv6/BiasAdd/ReadVariableOp2ae_mnist/sequential_1/conv6/BiasAdd/ReadVariableOp2f
1ae_mnist/sequential_1/conv6/Conv2D/ReadVariableOp1ae_mnist/sequential_1/conv6/Conv2D/ReadVariableOp2h
2ae_mnist/sequential_1/conv7/BiasAdd/ReadVariableOp2ae_mnist/sequential_1/conv7/BiasAdd/ReadVariableOp2f
1ae_mnist/sequential_1/conv7/Conv2D/ReadVariableOp1ae_mnist/sequential_1/conv7/Conv2D/ReadVariableOp2v
9ae_mnist/sequential_1/decodeLayer1/BiasAdd/ReadVariableOp9ae_mnist/sequential_1/decodeLayer1/BiasAdd/ReadVariableOp2t
8ae_mnist/sequential_1/decodeLayer1/MatMul/ReadVariableOp8ae_mnist/sequential_1/decodeLayer1/MatMul/ReadVariableOp2t
8ae_mnist/sequential_1/outputLayer/BiasAdd/ReadVariableOp8ae_mnist/sequential_1/outputLayer/BiasAdd/ReadVariableOp2r
7ae_mnist/sequential_1/outputLayer/MatMul/ReadVariableOp7ae_mnist/sequential_1/outputLayer/MatMul/ReadVariableOp:X T
/
_output_shapes
:         
!
_user_specified_name	input_1
э
·
A__inference_conv6_layer_call_and_return_conditional_losses_350199

inputs8
conv2d_readvariableop_resource:@-
biasadd_readvariableop_resource:
identityИвBiasAdd/ReadVariableOpвConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:@*
dtype0л
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+                           *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0П
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+                           j
ReluReluBiasAdd:output:0*
T0*A
_output_shapes/
-:+                           {
IdentityIdentityRelu:activations:0^NoOp*
T0*A
_output_shapes/
-:+                           w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+                           @: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:i e
A
_output_shapes/
-:+                           @
 
_user_specified_nameinputs
╤
d
H__inference_reshapeLayer_layer_call_and_return_conditional_losses_351896

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:╤
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :й
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:l
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:         `
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:         "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:         И:P L
(
_output_shapes
:         И
 
_user_specified_nameinputs
э
·
A__inference_conv5_layer_call_and_return_conditional_losses_350181

inputs8
conv2d_readvariableop_resource:@-
biasadd_readvariableop_resource:@
identityИвBiasAdd/ReadVariableOpвConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:@*
dtype0л
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+                           @*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0П
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+                           @j
ReluReluBiasAdd:output:0*
T0*A
_output_shapes/
-:+                           @{
IdentityIdentityRelu:activations:0^NoOp*
T0*A
_output_shapes/
-:+                           @w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+                           : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:i e
A
_output_shapes/
-:+                           
 
_user_specified_nameinputs
ё
c
*__inference_predense2_layer_call_fn_351773

inputs
identityИвStatefulPartitionedCall└
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_predense2_layer_call_and_return_conditional_losses_349830o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         @`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:         @22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
╝
У
&__inference_dense_layer_call_fn_351799

inputs
unknown:@
	unknown_0:
identityИвStatefulPartitionedCall╓
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_dense_layer_call_and_return_conditional_losses_349766o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:         @: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
ж

·
G__inference_outputLayer_layer_call_and_return_conditional_losses_350147

inputs1
matmul_readvariableop_resource:	@И.
biasadd_readvariableop_resource:	И
identityИвBiasAdd/ReadVariableOpвMatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@И*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:         Иs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:И*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ИQ
ReluReluBiasAdd:output:0*
T0*(
_output_shapes
:         Иb
IdentityIdentityRelu:activations:0^NoOp*
T0*(
_output_shapes
:         Иw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:         @: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
щ

М
-__inference_sequential_1_layer_call_fn_351462

inputs
unknown:@
	unknown_0:@
	unknown_1:	@И
	unknown_2:	И#
	unknown_3:@
	unknown_4:@#
	unknown_5:@
	unknown_6:#
	unknown_7:
	unknown_8:
identityИвStatefulPartitionedCall▀
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_sequential_1_layer_call_and_return_conditional_losses_350223Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+                           `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':         : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
д
B
&__inference_pool2_layer_call_fn_351727

inputs
identity╧
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *J
_output_shapes8
6:4                                    * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_pool2_layer_call_and_return_conditional_losses_349668Г
IdentityIdentityPartitionedCall:output:0*
T0*J
_output_shapes8
6:4                                    "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4                                    :r n
J
_output_shapes8
6:4                                    
 
_user_specified_nameinputs
э
·
A__inference_conv6_layer_call_and_return_conditional_losses_351970

inputs8
conv2d_readvariableop_resource:@-
biasadd_readvariableop_resource:
identityИвBiasAdd/ReadVariableOpвConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:@*
dtype0л
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+                           *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0П
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+                           j
ReluReluBiasAdd:output:0*
T0*A
_output_shapes/
-:+                           {
IdentityIdentityRelu:activations:0^NoOp*
T0*A
_output_shapes/
-:+                           w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+                           @: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:i e
A
_output_shapes/
-:+                           @
 
_user_specified_nameinputs
Я
F
*__inference_predense2_layer_call_fn_351768

inputs
identity░
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_predense2_layer_call_and_return_conditional_losses_349753`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:         @"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:         @:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
╛
▄
$__inference_signature_wrapper_350948
input_1!
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:#
	unknown_5: 
	unknown_6: 
	unknown_7:	а@
	unknown_8:@
	unknown_9:@

unknown_10:

unknown_11:@

unknown_12:@

unknown_13:	@И

unknown_14:	И$

unknown_15:@

unknown_16:@$

unknown_17:@

unknown_18:$

unknown_19:

unknown_20:
identityИвStatefulPartitionedCall╬
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20*"
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:         *8
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8В **
f%R#
!__inference__wrapped_model_349583w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:         `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*Z
_input_shapesI
G:         : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:         
!
_user_specified_name	input_1
э
·
A__inference_conv7_layer_call_and_return_conditional_losses_350216

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identityИвBiasAdd/ReadVariableOpвConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0л
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+                           *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0П
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+                           j
ReluReluBiasAdd:output:0*
T0*A
_output_shapes/
-:+                           {
IdentityIdentityRelu:activations:0^NoOp*
T0*A
_output_shapes/
-:+                           w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+                           : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:i e
A
_output_shapes/
-:+                           
 
_user_specified_nameinputs
ф
Ы
&__inference_conv2_layer_call_fn_351711

inputs!
unknown: 
	unknown_0: 
identityИвStatefulPartitionedCall▐
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:          *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv2_layer_call_and_return_conditional_losses_349716w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:          `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:         : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:         
 
_user_specified_nameinputs
щ

М
-__inference_sequential_1_layer_call_fn_351487

inputs
unknown:@
	unknown_0:@
	unknown_1:	@И
	unknown_2:	И#
	unknown_3:@
	unknown_4:@#
	unknown_5:@
	unknown_6:#
	unknown_7:
	unknown_8:
identityИвStatefulPartitionedCall▀
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_sequential_1_layer_call_and_return_conditional_losses_350385Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+                           `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':         : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
ч
у
D__inference_ae_mnist_layer_call_and_return_conditional_losses_350553
x+
sequential_350506:
sequential_350508:
sequential_350510:
sequential_350512:
sequential_350514:
sequential_350516:+
sequential_350518: 
sequential_350520: $
sequential_350522:	а@
sequential_350524:@#
sequential_350526:@
sequential_350528:%
sequential_1_350531:@!
sequential_1_350533:@&
sequential_1_350535:	@И"
sequential_1_350537:	И-
sequential_1_350539:@!
sequential_1_350541:@-
sequential_1_350543:@!
sequential_1_350545:-
sequential_1_350547:!
sequential_1_350549:
identityИв"sequential/StatefulPartitionedCallв$sequential_1/StatefulPartitionedCall┼
"sequential/StatefulPartitionedCallStatefulPartitionedCallxsequential_350506sequential_350508sequential_350510sequential_350512sequential_350514sequential_350516sequential_350518sequential_350520sequential_350522sequential_350524sequential_350526sequential_350528*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *.
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8В *O
fJRH
F__inference_sequential_layer_call_and_return_conditional_losses_349773ў
$sequential_1/StatefulPartitionedCallStatefulPartitionedCall+sequential/StatefulPartitionedCall:output:0sequential_1_350531sequential_1_350533sequential_1_350535sequential_1_350537sequential_1_350539sequential_1_350541sequential_1_350543sequential_1_350545sequential_1_350547sequential_1_350549*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_sequential_1_layer_call_and_return_conditional_losses_350223Ц
IdentityIdentity-sequential_1/StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+                           Т
NoOpNoOp#^sequential/StatefulPartitionedCall%^sequential_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*Z
_input_shapesI
G:         : : : : : : : : : : : : : : : : : : : : : : 2H
"sequential/StatefulPartitionedCall"sequential/StatefulPartitionedCall2L
$sequential_1/StatefulPartitionedCall$sequential_1/StatefulPartitionedCall:R N
/
_output_shapes
:         

_user_specified_namex
╠
Ы
,__inference_outputLayer_layer_call_fn_351866

inputs
unknown:	@И
	unknown_0:	И
identityИвStatefulPartitionedCall▌
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         И*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *P
fKRI
G__inference_outputLayer_layer_call_and_return_conditional_losses_350147p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:         И`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:         @: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
А
·
A__inference_conv1_layer_call_and_return_conditional_losses_349689

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identityИвBiasAdd/ReadVariableOpвConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0Щ
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:         *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:         X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:         i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:         w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:         : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:         
 
_user_specified_nameinputs
є	
d
E__inference_predense2_layer_call_and_return_conditional_losses_349830

inputs
identityИR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  а?d
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:         @C
dropout/ShapeShapeinputs*
T0*
_output_shapes
:М
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:         @*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *═╠L>ж
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:         @o
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:         @i
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*'
_output_shapes
:         @Y
IdentityIdentitydropout/Mul_1:z:0*
T0*'
_output_shapes
:         @"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:         @:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
Э

Ї
B__inference_dense1_layer_call_and_return_conditional_losses_351763

inputs1
matmul_readvariableop_resource:	а@-
biasadd_readvariableop_resource:@
identityИвBiasAdd/ReadVariableOpвMatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	а@*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:         @a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:         @w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:         а: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:         а
 
_user_specified_nameinputs
╟
a
E__inference_predense1_layer_call_and_return_conditional_losses_349729

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"       ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:         аY
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:         а"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:          :W S
/
_output_shapes
:          
 
_user_specified_nameinputs
Э

Ї
B__inference_dense1_layer_call_and_return_conditional_losses_349742

inputs1
matmul_readvariableop_resource:	а@-
biasadd_readvariableop_resource:@
identityИвBiasAdd/ReadVariableOpвMatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	а@*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:         @a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:         @w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:         а: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:         а
 
_user_specified_nameinputs
П(
Ї
H__inference_sequential_1_layer_call_and_return_conditional_losses_350223

inputs%
decodelayer1_350124:@!
decodelayer1_350126:@%
outputlayer_350148:	@И!
outputlayer_350150:	И&
conv5_350182:@
conv5_350184:@&
conv6_350200:@
conv6_350202:&
conv7_350217:
conv7_350219:
identityИвconv5/StatefulPartitionedCallвconv6/StatefulPartitionedCallвconv7/StatefulPartitionedCallв$decodeLayer1/StatefulPartitionedCallв#outputLayer/StatefulPartitionedCallА
$decodeLayer1/StatefulPartitionedCallStatefulPartitionedCallinputsdecodelayer1_350124decodelayer1_350126*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_decodeLayer1_layer_call_and_return_conditional_losses_350123▌
dropout/PartitionedCallPartitionedCall-decodeLayer1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_350134Ч
#outputLayer/StatefulPartitionedCallStatefulPartitionedCall dropout/PartitionedCall:output:0outputlayer_350148outputlayer_350150*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         И*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *P
fKRI
G__inference_outputLayer_layer_call_and_return_conditional_losses_350147ю
reshapeLayer/PartitionedCallPartitionedCall,outputLayer/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:         * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_reshapeLayer_layer_call_and_return_conditional_losses_350167Б
 upSamplingLayer2/PartitionedCallPartitionedCall%reshapeLayer/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *U
fPRN
L__inference_upSamplingLayer2_layer_call_and_return_conditional_losses_350083б
conv5/StatefulPartitionedCallStatefulPartitionedCall)upSamplingLayer2/PartitionedCall:output:0conv5_350182conv5_350184*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           @*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv5_layer_call_and_return_conditional_losses_350181В
 upSamplingLayer3/PartitionedCallPartitionedCall&conv5/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           @* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *U
fPRN
L__inference_upSamplingLayer3_layer_call_and_return_conditional_losses_350102б
conv6/StatefulPartitionedCallStatefulPartitionedCall)upSamplingLayer3/PartitionedCall:output:0conv6_350200conv6_350202*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv6_layer_call_and_return_conditional_losses_350199Ю
conv7/StatefulPartitionedCallStatefulPartitionedCall&conv6/StatefulPartitionedCall:output:0conv7_350217conv7_350219*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv7_layer_call_and_return_conditional_losses_350216П
IdentityIdentity&conv7/StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+                           є
NoOpNoOp^conv5/StatefulPartitionedCall^conv6/StatefulPartitionedCall^conv7/StatefulPartitionedCall%^decodeLayer1/StatefulPartitionedCall$^outputLayer/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':         : : : : : : : : : : 2>
conv5/StatefulPartitionedCallconv5/StatefulPartitionedCall2>
conv6/StatefulPartitionedCallconv6/StatefulPartitionedCall2>
conv7/StatefulPartitionedCallconv7/StatefulPartitionedCall2L
$decodeLayer1/StatefulPartitionedCall$decodeLayer1/StatefulPartitionedCall2J
#outputLayer/StatefulPartitionedCall#outputLayer/StatefulPartitionedCall:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
кC
З
H__inference_sequential_1_layer_call_and_return_conditional_losses_351545

inputs=
+decodelayer1_matmul_readvariableop_resource:@:
,decodelayer1_biasadd_readvariableop_resource:@=
*outputlayer_matmul_readvariableop_resource:	@И:
+outputlayer_biasadd_readvariableop_resource:	И>
$conv5_conv2d_readvariableop_resource:@3
%conv5_biasadd_readvariableop_resource:@>
$conv6_conv2d_readvariableop_resource:@3
%conv6_biasadd_readvariableop_resource:>
$conv7_conv2d_readvariableop_resource:3
%conv7_biasadd_readvariableop_resource:
identityИвconv5/BiasAdd/ReadVariableOpвconv5/Conv2D/ReadVariableOpвconv6/BiasAdd/ReadVariableOpвconv6/Conv2D/ReadVariableOpвconv7/BiasAdd/ReadVariableOpвconv7/Conv2D/ReadVariableOpв#decodeLayer1/BiasAdd/ReadVariableOpв"decodeLayer1/MatMul/ReadVariableOpв"outputLayer/BiasAdd/ReadVariableOpв!outputLayer/MatMul/ReadVariableOpО
"decodeLayer1/MatMul/ReadVariableOpReadVariableOp+decodelayer1_matmul_readvariableop_resource*
_output_shapes

:@*
dtype0Г
decodeLayer1/MatMulMatMulinputs*decodeLayer1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @М
#decodeLayer1/BiasAdd/ReadVariableOpReadVariableOp,decodelayer1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Э
decodeLayer1/BiasAddBiasAdddecodeLayer1/MatMul:product:0+decodeLayer1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @j
decodeLayer1/ReluReludecodeLayer1/BiasAdd:output:0*
T0*'
_output_shapes
:         @o
dropout/IdentityIdentitydecodeLayer1/Relu:activations:0*
T0*'
_output_shapes
:         @Н
!outputLayer/MatMul/ReadVariableOpReadVariableOp*outputlayer_matmul_readvariableop_resource*
_output_shapes
:	@И*
dtype0Х
outputLayer/MatMulMatMuldropout/Identity:output:0)outputLayer/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ИЛ
"outputLayer/BiasAdd/ReadVariableOpReadVariableOp+outputlayer_biasadd_readvariableop_resource*
_output_shapes	
:И*
dtype0Ы
outputLayer/BiasAddBiasAddoutputLayer/MatMul:product:0*outputLayer/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:         Иi
outputLayer/ReluReluoutputLayer/BiasAdd:output:0*
T0*(
_output_shapes
:         И`
reshapeLayer/ShapeShapeoutputLayer/Relu:activations:0*
T0*
_output_shapes
:j
 reshapeLayer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: l
"reshapeLayer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:l
"reshapeLayer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Т
reshapeLayer/strided_sliceStridedSlicereshapeLayer/Shape:output:0)reshapeLayer/strided_slice/stack:output:0+reshapeLayer/strided_slice/stack_1:output:0+reshapeLayer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask^
reshapeLayer/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :^
reshapeLayer/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :^
reshapeLayer/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :ъ
reshapeLayer/Reshape/shapePack#reshapeLayer/strided_slice:output:0%reshapeLayer/Reshape/shape/1:output:0%reshapeLayer/Reshape/shape/2:output:0%reshapeLayer/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:Ю
reshapeLayer/ReshapeReshapeoutputLayer/Relu:activations:0#reshapeLayer/Reshape/shape:output:0*
T0*/
_output_shapes
:         g
upSamplingLayer2/ConstConst*
_output_shapes
:*
dtype0*
valueB"      i
upSamplingLayer2/Const_1Const*
_output_shapes
:*
dtype0*
valueB"      Д
upSamplingLayer2/mulMulupSamplingLayer2/Const:output:0!upSamplingLayer2/Const_1:output:0*
T0*
_output_shapes
:╙
-upSamplingLayer2/resize/ResizeNearestNeighborResizeNearestNeighborreshapeLayer/Reshape:output:0upSamplingLayer2/mul:z:0*
T0*/
_output_shapes
:         *
half_pixel_centers(И
conv5/Conv2D/ReadVariableOpReadVariableOp$conv5_conv2d_readvariableop_resource*&
_output_shapes
:@*
dtype0▌
conv5/Conv2DConv2D>upSamplingLayer2/resize/ResizeNearestNeighbor:resized_images:0#conv5/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:         @*
paddingSAME*
strides
~
conv5/BiasAdd/ReadVariableOpReadVariableOp%conv5_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0П
conv5/BiasAddBiasAddconv5/Conv2D:output:0$conv5/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:         @d

conv5/ReluReluconv5/BiasAdd:output:0*
T0*/
_output_shapes
:         @g
upSamplingLayer3/ConstConst*
_output_shapes
:*
dtype0*
valueB"      i
upSamplingLayer3/Const_1Const*
_output_shapes
:*
dtype0*
valueB"      Д
upSamplingLayer3/mulMulupSamplingLayer3/Const:output:0!upSamplingLayer3/Const_1:output:0*
T0*
_output_shapes
:╬
-upSamplingLayer3/resize/ResizeNearestNeighborResizeNearestNeighborconv5/Relu:activations:0upSamplingLayer3/mul:z:0*
T0*/
_output_shapes
:         @*
half_pixel_centers(И
conv6/Conv2D/ReadVariableOpReadVariableOp$conv6_conv2d_readvariableop_resource*&
_output_shapes
:@*
dtype0▌
conv6/Conv2DConv2D>upSamplingLayer3/resize/ResizeNearestNeighbor:resized_images:0#conv6/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:         *
paddingSAME*
strides
~
conv6/BiasAdd/ReadVariableOpReadVariableOp%conv6_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0П
conv6/BiasAddBiasAddconv6/Conv2D:output:0$conv6/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:         d

conv6/ReluReluconv6/BiasAdd:output:0*
T0*/
_output_shapes
:         И
conv7/Conv2D/ReadVariableOpReadVariableOp$conv7_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0╖
conv7/Conv2DConv2Dconv6/Relu:activations:0#conv7/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:         *
paddingSAME*
strides
~
conv7/BiasAdd/ReadVariableOpReadVariableOp%conv7_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0П
conv7/BiasAddBiasAddconv7/Conv2D:output:0$conv7/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:         d

conv7/ReluReluconv7/BiasAdd:output:0*
T0*/
_output_shapes
:         o
IdentityIdentityconv7/Relu:activations:0^NoOp*
T0*/
_output_shapes
:         С
NoOpNoOp^conv5/BiasAdd/ReadVariableOp^conv5/Conv2D/ReadVariableOp^conv6/BiasAdd/ReadVariableOp^conv6/Conv2D/ReadVariableOp^conv7/BiasAdd/ReadVariableOp^conv7/Conv2D/ReadVariableOp$^decodeLayer1/BiasAdd/ReadVariableOp#^decodeLayer1/MatMul/ReadVariableOp#^outputLayer/BiasAdd/ReadVariableOp"^outputLayer/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':         : : : : : : : : : : 2<
conv5/BiasAdd/ReadVariableOpconv5/BiasAdd/ReadVariableOp2:
conv5/Conv2D/ReadVariableOpconv5/Conv2D/ReadVariableOp2<
conv6/BiasAdd/ReadVariableOpconv6/BiasAdd/ReadVariableOp2:
conv6/Conv2D/ReadVariableOpconv6/Conv2D/ReadVariableOp2<
conv7/BiasAdd/ReadVariableOpconv7/BiasAdd/ReadVariableOp2:
conv7/Conv2D/ReadVariableOpconv7/Conv2D/ReadVariableOp2J
#decodeLayer1/BiasAdd/ReadVariableOp#decodeLayer1/BiasAdd/ReadVariableOp2H
"decodeLayer1/MatMul/ReadVariableOp"decodeLayer1/MatMul/ReadVariableOp2H
"outputLayer/BiasAdd/ReadVariableOp"outputLayer/BiasAdd/ReadVariableOp2F
!outputLayer/MatMul/ReadVariableOp!outputLayer/MatMul/ReadVariableOp:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
╩
Ъ
O__inference_batch_normalization_layer_call_and_return_conditional_losses_351674

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identityИвFusedBatchNormV3/ReadVariableOpв!FusedBatchNormV3/ReadVariableOp_1вReadVariableOpвReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0Д
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0И
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0╚
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+                           :::::*
epsilon%oГ:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+                           ░
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+                           : : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+                           
 
_user_specified_nameinputs
э
·
A__inference_conv7_layer_call_and_return_conditional_losses_351990

inputs8
conv2d_readvariableop_resource:-
biasadd_readvariableop_resource:
identityИвBiasAdd/ReadVariableOpвConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:*
dtype0л
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+                           *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0П
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+                           j
ReluReluBiasAdd:output:0*
T0*A
_output_shapes/
-:+                           {
IdentityIdentityRelu:activations:0^NoOp*
T0*A
_output_shapes/
-:+                           w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+                           : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:i e
A
_output_shapes/
-:+                           
 
_user_specified_nameinputs
н
Ы
&__inference_conv5_layer_call_fn_351922

inputs!
unknown:@
	unknown_0:@
identityИвStatefulPartitionedCallЁ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           @*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv5_layer_call_and_return_conditional_losses_350181Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+                           @`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+                           : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+                           
 
_user_specified_nameinputs
н
Ы
&__inference_conv7_layer_call_fn_351979

inputs!
unknown:
	unknown_0:
identityИвStatefulPartitionedCallЁ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv7_layer_call_and_return_conditional_losses_350216Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+                           `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+                           : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+                           
 
_user_specified_nameinputs
Я

∙
H__inference_decodeLayer1_layer_call_and_return_conditional_losses_351830

inputs0
matmul_readvariableop_resource:@-
biasadd_readvariableop_resource:@
identityИвBiasAdd/ReadVariableOpвMatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @P
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:         @a
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:         @w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:         : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
Н
Ш
-__inference_sequential_1_layer_call_fn_350433
decodelayer1_input
unknown:@
	unknown_0:@
	unknown_1:	@И
	unknown_2:	И#
	unknown_3:@
	unknown_4:@#
	unknown_5:@
	unknown_6:#
	unknown_7:
	unknown_8:
identityИвStatefulPartitionedCallы
StatefulPartitionedCallStatefulPartitionedCalldecodelayer1_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_sequential_1_layer_call_and_return_conditional_losses_350385Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+                           `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':         : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
'
_output_shapes
:         
,
_user_specified_namedecodeLayer1_input
О

Є
A__inference_dense_layer_call_and_return_conditional_losses_351810

inputs0
matmul_readvariableop_resource:@-
biasadd_readvariableop_resource:
identityИвBiasAdd/ReadVariableOpвMatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         P
TanhTanhBiasAdd:output:0*
T0*'
_output_shapes
:         W
IdentityIdentityTanh:y:0^NoOp*
T0*'
_output_shapes
:         w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:         @: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
ў
щ
D__inference_ae_mnist_layer_call_and_return_conditional_losses_350897
input_1+
sequential_350850:
sequential_350852:
sequential_350854:
sequential_350856:
sequential_350858:
sequential_350860:+
sequential_350862: 
sequential_350864: $
sequential_350866:	а@
sequential_350868:@#
sequential_350870:@
sequential_350872:%
sequential_1_350875:@!
sequential_1_350877:@&
sequential_1_350879:	@И"
sequential_1_350881:	И-
sequential_1_350883:@!
sequential_1_350885:@-
sequential_1_350887:@!
sequential_1_350889:-
sequential_1_350891:!
sequential_1_350893:
identityИв"sequential/StatefulPartitionedCallв$sequential_1/StatefulPartitionedCall╔
"sequential/StatefulPartitionedCallStatefulPartitionedCallinput_1sequential_350850sequential_350852sequential_350854sequential_350856sequential_350858sequential_350860sequential_350862sequential_350864sequential_350866sequential_350868sequential_350870sequential_350872*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8В *O
fJRH
F__inference_sequential_layer_call_and_return_conditional_losses_349937ў
$sequential_1/StatefulPartitionedCallStatefulPartitionedCall+sequential/StatefulPartitionedCall:output:0sequential_1_350875sequential_1_350877sequential_1_350879sequential_1_350881sequential_1_350883sequential_1_350885sequential_1_350887sequential_1_350889sequential_1_350891sequential_1_350893*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_sequential_1_layer_call_and_return_conditional_losses_350385Ц
IdentityIdentity-sequential_1/StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+                           Т
NoOpNoOp#^sequential/StatefulPartitionedCall%^sequential_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*Z
_input_shapesI
G:         : : : : : : : : : : : : : : : : : : : : : : 2H
"sequential/StatefulPartitionedCall"sequential/StatefulPartitionedCall2L
$sequential_1/StatefulPartitionedCall$sequential_1/StatefulPartitionedCall:X T
/
_output_shapes
:         
!
_user_specified_name	input_1
╖
I
-__inference_reshapeLayer_layer_call_fn_351882

inputs
identity╗
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:         * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_reshapeLayer_layer_call_and_return_conditional_losses_350167h
IdentityIdentityPartitionedCall:output:0*
T0*/
_output_shapes
:         "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:         И:P L
(
_output_shapes
:         И
 
_user_specified_nameinputs
З(
─
F__inference_sequential_layer_call_and_return_conditional_losses_350030
conv1_input&
conv1_349996:
conv1_349998:(
batch_normalization_350001:(
batch_normalization_350003:(
batch_normalization_350005:(
batch_normalization_350007:&
conv2_350011: 
conv2_350013:  
dense1_350018:	а@
dense1_350020:@
dense_350024:@
dense_350026:
identityИв+batch_normalization/StatefulPartitionedCallвconv1/StatefulPartitionedCallвconv2/StatefulPartitionedCallвdense/StatefulPartitionedCallвdense1/StatefulPartitionedCallё
conv1/StatefulPartitionedCallStatefulPartitionedCallconv1_inputconv1_349996conv1_349998*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv1_layer_call_and_return_conditional_losses_349689А
+batch_normalization/StatefulPartitionedCallStatefulPartitionedCall&conv1/StatefulPartitionedCall:output:0batch_normalization_350001batch_normalization_350003batch_normalization_350005batch_normalization_350007*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:         *&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *X
fSRQ
O__inference_batch_normalization_layer_call_and_return_conditional_losses_349605ш
pool1/PartitionedCallPartitionedCall4batch_normalization/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:         * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_pool1_layer_call_and_return_conditional_losses_349656Д
conv2/StatefulPartitionedCallStatefulPartitionedCallpool1/PartitionedCall:output:0conv2_350011conv2_350013*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:          *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv2_layer_call_and_return_conditional_losses_349716┌
pool2/PartitionedCallPartitionedCall&conv2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:          * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_pool2_layer_call_and_return_conditional_losses_349668╙
predense1/PartitionedCallPartitionedCallpool2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         а* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_predense1_layer_call_and_return_conditional_losses_349729Д
dense1/StatefulPartitionedCallStatefulPartitionedCall"predense1/PartitionedCall:output:0dense1_350018dense1_350020*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense1_layer_call_and_return_conditional_losses_349742█
predense2/PartitionedCallPartitionedCall'dense1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_predense2_layer_call_and_return_conditional_losses_349753А
dense/StatefulPartitionedCallStatefulPartitionedCall"predense2/PartitionedCall:output:0dense_350024dense_350026*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_dense_layer_call_and_return_conditional_losses_349766u
IdentityIdentity&dense/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         ї
NoOpNoOp,^batch_normalization/StatefulPartitionedCall^conv1/StatefulPartitionedCall^conv2/StatefulPartitionedCall^dense/StatefulPartitionedCall^dense1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*F
_input_shapes5
3:         : : : : : : : : : : : : 2Z
+batch_normalization/StatefulPartitionedCall+batch_normalization/StatefulPartitionedCall2>
conv1/StatefulPartitionedCallconv1/StatefulPartitionedCall2>
conv2/StatefulPartitionedCallconv2/StatefulPartitionedCall2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2@
dense1/StatefulPartitionedCalldense1/StatefulPartitionedCall:\ X
/
_output_shapes
:         
%
_user_specified_nameconv1_input
п)
Ц
H__inference_sequential_1_layer_call_and_return_conditional_losses_350385

inputs%
decodelayer1_350355:@!
decodelayer1_350357:@%
outputlayer_350361:	@И!
outputlayer_350363:	И&
conv5_350368:@
conv5_350370:@&
conv6_350374:@
conv6_350376:&
conv7_350379:
conv7_350381:
identityИвconv5/StatefulPartitionedCallвconv6/StatefulPartitionedCallвconv7/StatefulPartitionedCallв$decodeLayer1/StatefulPartitionedCallвdropout/StatefulPartitionedCallв#outputLayer/StatefulPartitionedCallА
$decodeLayer1/StatefulPartitionedCallStatefulPartitionedCallinputsdecodelayer1_350355decodelayer1_350357*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_decodeLayer1_layer_call_and_return_conditional_losses_350123э
dropout/StatefulPartitionedCallStatefulPartitionedCall-decodeLayer1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_350312Я
#outputLayer/StatefulPartitionedCallStatefulPartitionedCall(dropout/StatefulPartitionedCall:output:0outputlayer_350361outputlayer_350363*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         И*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *P
fKRI
G__inference_outputLayer_layer_call_and_return_conditional_losses_350147ю
reshapeLayer/PartitionedCallPartitionedCall,outputLayer/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:         * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_reshapeLayer_layer_call_and_return_conditional_losses_350167Б
 upSamplingLayer2/PartitionedCallPartitionedCall%reshapeLayer/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *U
fPRN
L__inference_upSamplingLayer2_layer_call_and_return_conditional_losses_350083б
conv5/StatefulPartitionedCallStatefulPartitionedCall)upSamplingLayer2/PartitionedCall:output:0conv5_350368conv5_350370*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           @*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv5_layer_call_and_return_conditional_losses_350181В
 upSamplingLayer3/PartitionedCallPartitionedCall&conv5/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           @* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *U
fPRN
L__inference_upSamplingLayer3_layer_call_and_return_conditional_losses_350102б
conv6/StatefulPartitionedCallStatefulPartitionedCall)upSamplingLayer3/PartitionedCall:output:0conv6_350374conv6_350376*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv6_layer_call_and_return_conditional_losses_350199Ю
conv7/StatefulPartitionedCallStatefulPartitionedCall&conv6/StatefulPartitionedCall:output:0conv7_350379conv7_350381*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv7_layer_call_and_return_conditional_losses_350216П
IdentityIdentity&conv7/StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+                           Х
NoOpNoOp^conv5/StatefulPartitionedCall^conv6/StatefulPartitionedCall^conv7/StatefulPartitionedCall%^decodeLayer1/StatefulPartitionedCall ^dropout/StatefulPartitionedCall$^outputLayer/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':         : : : : : : : : : : 2>
conv5/StatefulPartitionedCallconv5/StatefulPartitionedCall2>
conv6/StatefulPartitionedCallconv6/StatefulPartitionedCall2>
conv7/StatefulPartitionedCallconv7/StatefulPartitionedCall2L
$decodeLayer1/StatefulPartitionedCall$decodeLayer1/StatefulPartitionedCall2B
dropout/StatefulPartitionedCalldropout/StatefulPartitionedCall2J
#outputLayer/StatefulPartitionedCall#outputLayer/StatefulPartitionedCall:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
╩
Ъ
-__inference_decodeLayer1_layer_call_fn_351819

inputs
unknown:@
	unknown_0:@
identityИвStatefulPartitionedCall▌
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_decodeLayer1_layer_call_and_return_conditional_losses_350123o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         @`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:         : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
ё	
b
C__inference_dropout_layer_call_and_return_conditional_losses_350312

inputs
identityИR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  а?d
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:         @C
dropout/ShapeShapeinputs*
T0*
_output_shapes
:М
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:         @*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *═╠L>ж
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:         @o
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:         @i
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*'
_output_shapes
:         @Y
IdentityIdentitydropout/Mul_1:z:0*
T0*'
_output_shapes
:         @"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:         @:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
║
M
1__inference_upSamplingLayer3_layer_call_fn_351938

inputs
identity┌
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *J
_output_shapes8
6:4                                    * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *U
fPRN
L__inference_upSamplingLayer3_layer_call_and_return_conditional_losses_350102Г
IdentityIdentityPartitionedCall:output:0*
T0*J
_output_shapes8
6:4                                    "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4                                    :r n
J
_output_shapes8
6:4                                    
 
_user_specified_nameinputs
╩
Ъ
O__inference_batch_normalization_layer_call_and_return_conditional_losses_349605

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identityИвFusedBatchNormV3/ReadVariableOpв!FusedBatchNormV3/ReadVariableOp_1вReadVariableOpвReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0Д
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0И
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0╚
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+                           :::::*
epsilon%oГ:*
is_training( }
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+                           ░
NoOpNoOp ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+                           : : : : 2B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+                           
 
_user_specified_nameinputs
уУ
У
D__inference_ae_mnist_layer_call_and_return_conditional_losses_351151
xI
/sequential_conv1_conv2d_readvariableop_resource:>
0sequential_conv1_biasadd_readvariableop_resource:D
6sequential_batch_normalization_readvariableop_resource:F
8sequential_batch_normalization_readvariableop_1_resource:U
Gsequential_batch_normalization_fusedbatchnormv3_readvariableop_resource:W
Isequential_batch_normalization_fusedbatchnormv3_readvariableop_1_resource:I
/sequential_conv2_conv2d_readvariableop_resource: >
0sequential_conv2_biasadd_readvariableop_resource: C
0sequential_dense1_matmul_readvariableop_resource:	а@?
1sequential_dense1_biasadd_readvariableop_resource:@A
/sequential_dense_matmul_readvariableop_resource:@>
0sequential_dense_biasadd_readvariableop_resource:J
8sequential_1_decodelayer1_matmul_readvariableop_resource:@G
9sequential_1_decodelayer1_biasadd_readvariableop_resource:@J
7sequential_1_outputlayer_matmul_readvariableop_resource:	@ИG
8sequential_1_outputlayer_biasadd_readvariableop_resource:	ИK
1sequential_1_conv5_conv2d_readvariableop_resource:@@
2sequential_1_conv5_biasadd_readvariableop_resource:@K
1sequential_1_conv6_conv2d_readvariableop_resource:@@
2sequential_1_conv6_biasadd_readvariableop_resource:K
1sequential_1_conv7_conv2d_readvariableop_resource:@
2sequential_1_conv7_biasadd_readvariableop_resource:
identityИв>sequential/batch_normalization/FusedBatchNormV3/ReadVariableOpв@sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp_1в-sequential/batch_normalization/ReadVariableOpв/sequential/batch_normalization/ReadVariableOp_1в'sequential/conv1/BiasAdd/ReadVariableOpв&sequential/conv1/Conv2D/ReadVariableOpв'sequential/conv2/BiasAdd/ReadVariableOpв&sequential/conv2/Conv2D/ReadVariableOpв'sequential/dense/BiasAdd/ReadVariableOpв&sequential/dense/MatMul/ReadVariableOpв(sequential/dense1/BiasAdd/ReadVariableOpв'sequential/dense1/MatMul/ReadVariableOpв)sequential_1/conv5/BiasAdd/ReadVariableOpв(sequential_1/conv5/Conv2D/ReadVariableOpв)sequential_1/conv6/BiasAdd/ReadVariableOpв(sequential_1/conv6/Conv2D/ReadVariableOpв)sequential_1/conv7/BiasAdd/ReadVariableOpв(sequential_1/conv7/Conv2D/ReadVariableOpв0sequential_1/decodeLayer1/BiasAdd/ReadVariableOpв/sequential_1/decodeLayer1/MatMul/ReadVariableOpв/sequential_1/outputLayer/BiasAdd/ReadVariableOpв.sequential_1/outputLayer/MatMul/ReadVariableOpЮ
&sequential/conv1/Conv2D/ReadVariableOpReadVariableOp/sequential_conv1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0╢
sequential/conv1/Conv2DConv2Dx.sequential/conv1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:         *
paddingSAME*
strides
Ф
'sequential/conv1/BiasAdd/ReadVariableOpReadVariableOp0sequential_conv1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0░
sequential/conv1/BiasAddBiasAdd sequential/conv1/Conv2D:output:0/sequential/conv1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:         z
sequential/conv1/ReluRelu!sequential/conv1/BiasAdd:output:0*
T0*/
_output_shapes
:         а
-sequential/batch_normalization/ReadVariableOpReadVariableOp6sequential_batch_normalization_readvariableop_resource*
_output_shapes
:*
dtype0д
/sequential/batch_normalization/ReadVariableOp_1ReadVariableOp8sequential_batch_normalization_readvariableop_1_resource*
_output_shapes
:*
dtype0┬
>sequential/batch_normalization/FusedBatchNormV3/ReadVariableOpReadVariableOpGsequential_batch_normalization_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0╞
@sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpIsequential_batch_normalization_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0ю
/sequential/batch_normalization/FusedBatchNormV3FusedBatchNormV3#sequential/conv1/Relu:activations:05sequential/batch_normalization/ReadVariableOp:value:07sequential/batch_normalization/ReadVariableOp_1:value:0Fsequential/batch_normalization/FusedBatchNormV3/ReadVariableOp:value:0Hsequential/batch_normalization/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:         :::::*
epsilon%oГ:*
is_training( ┼
sequential/pool1/MaxPoolMaxPool3sequential/batch_normalization/FusedBatchNormV3:y:0*/
_output_shapes
:         *
ksize
*
paddingVALID*
strides
Ю
&sequential/conv2/Conv2D/ReadVariableOpReadVariableOp/sequential_conv2_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0╓
sequential/conv2/Conv2DConv2D!sequential/pool1/MaxPool:output:0.sequential/conv2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:          *
paddingSAME*
strides
Ф
'sequential/conv2/BiasAdd/ReadVariableOpReadVariableOp0sequential_conv2_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0░
sequential/conv2/BiasAddBiasAdd sequential/conv2/Conv2D:output:0/sequential/conv2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:          z
sequential/conv2/ReluRelu!sequential/conv2/BiasAdd:output:0*
T0*/
_output_shapes
:          ╡
sequential/pool2/MaxPoolMaxPool#sequential/conv2/Relu:activations:0*/
_output_shapes
:          *
ksize
*
paddingVALID*
strides
k
sequential/predense1/ConstConst*
_output_shapes
:*
dtype0*
valueB"       в
sequential/predense1/ReshapeReshape!sequential/pool2/MaxPool:output:0#sequential/predense1/Const:output:0*
T0*(
_output_shapes
:         аЩ
'sequential/dense1/MatMul/ReadVariableOpReadVariableOp0sequential_dense1_matmul_readvariableop_resource*
_output_shapes
:	а@*
dtype0м
sequential/dense1/MatMulMatMul%sequential/predense1/Reshape:output:0/sequential/dense1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @Ц
(sequential/dense1/BiasAdd/ReadVariableOpReadVariableOp1sequential_dense1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0м
sequential/dense1/BiasAddBiasAdd"sequential/dense1/MatMul:product:00sequential/dense1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @t
sequential/dense1/ReluRelu"sequential/dense1/BiasAdd:output:0*
T0*'
_output_shapes
:         @Б
sequential/predense2/IdentityIdentity$sequential/dense1/Relu:activations:0*
T0*'
_output_shapes
:         @Ц
&sequential/dense/MatMul/ReadVariableOpReadVariableOp/sequential_dense_matmul_readvariableop_resource*
_output_shapes

:@*
dtype0л
sequential/dense/MatMulMatMul&sequential/predense2/Identity:output:0.sequential/dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         Ф
'sequential/dense/BiasAdd/ReadVariableOpReadVariableOp0sequential_dense_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0й
sequential/dense/BiasAddBiasAdd!sequential/dense/MatMul:product:0/sequential/dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         r
sequential/dense/TanhTanh!sequential/dense/BiasAdd:output:0*
T0*'
_output_shapes
:         и
/sequential_1/decodeLayer1/MatMul/ReadVariableOpReadVariableOp8sequential_1_decodelayer1_matmul_readvariableop_resource*
_output_shapes

:@*
dtype0░
 sequential_1/decodeLayer1/MatMulMatMulsequential/dense/Tanh:y:07sequential_1/decodeLayer1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @ж
0sequential_1/decodeLayer1/BiasAdd/ReadVariableOpReadVariableOp9sequential_1_decodelayer1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0─
!sequential_1/decodeLayer1/BiasAddBiasAdd*sequential_1/decodeLayer1/MatMul:product:08sequential_1/decodeLayer1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @Д
sequential_1/decodeLayer1/ReluRelu*sequential_1/decodeLayer1/BiasAdd:output:0*
T0*'
_output_shapes
:         @Й
sequential_1/dropout/IdentityIdentity,sequential_1/decodeLayer1/Relu:activations:0*
T0*'
_output_shapes
:         @з
.sequential_1/outputLayer/MatMul/ReadVariableOpReadVariableOp7sequential_1_outputlayer_matmul_readvariableop_resource*
_output_shapes
:	@И*
dtype0╝
sequential_1/outputLayer/MatMulMatMul&sequential_1/dropout/Identity:output:06sequential_1/outputLayer/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:         Ие
/sequential_1/outputLayer/BiasAdd/ReadVariableOpReadVariableOp8sequential_1_outputlayer_biasadd_readvariableop_resource*
_output_shapes	
:И*
dtype0┬
 sequential_1/outputLayer/BiasAddBiasAdd)sequential_1/outputLayer/MatMul:product:07sequential_1/outputLayer/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ИГ
sequential_1/outputLayer/ReluRelu)sequential_1/outputLayer/BiasAdd:output:0*
T0*(
_output_shapes
:         Иz
sequential_1/reshapeLayer/ShapeShape+sequential_1/outputLayer/Relu:activations:0*
T0*
_output_shapes
:w
-sequential_1/reshapeLayer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: y
/sequential_1/reshapeLayer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:y
/sequential_1/reshapeLayer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:╙
'sequential_1/reshapeLayer/strided_sliceStridedSlice(sequential_1/reshapeLayer/Shape:output:06sequential_1/reshapeLayer/strided_slice/stack:output:08sequential_1/reshapeLayer/strided_slice/stack_1:output:08sequential_1/reshapeLayer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskk
)sequential_1/reshapeLayer/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :k
)sequential_1/reshapeLayer/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :k
)sequential_1/reshapeLayer/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :л
'sequential_1/reshapeLayer/Reshape/shapePack0sequential_1/reshapeLayer/strided_slice:output:02sequential_1/reshapeLayer/Reshape/shape/1:output:02sequential_1/reshapeLayer/Reshape/shape/2:output:02sequential_1/reshapeLayer/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:┼
!sequential_1/reshapeLayer/ReshapeReshape+sequential_1/outputLayer/Relu:activations:00sequential_1/reshapeLayer/Reshape/shape:output:0*
T0*/
_output_shapes
:         t
#sequential_1/upSamplingLayer2/ConstConst*
_output_shapes
:*
dtype0*
valueB"      v
%sequential_1/upSamplingLayer2/Const_1Const*
_output_shapes
:*
dtype0*
valueB"      л
!sequential_1/upSamplingLayer2/mulMul,sequential_1/upSamplingLayer2/Const:output:0.sequential_1/upSamplingLayer2/Const_1:output:0*
T0*
_output_shapes
:·
:sequential_1/upSamplingLayer2/resize/ResizeNearestNeighborResizeNearestNeighbor*sequential_1/reshapeLayer/Reshape:output:0%sequential_1/upSamplingLayer2/mul:z:0*
T0*/
_output_shapes
:         *
half_pixel_centers(в
(sequential_1/conv5/Conv2D/ReadVariableOpReadVariableOp1sequential_1_conv5_conv2d_readvariableop_resource*&
_output_shapes
:@*
dtype0Д
sequential_1/conv5/Conv2DConv2DKsequential_1/upSamplingLayer2/resize/ResizeNearestNeighbor:resized_images:00sequential_1/conv5/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:         @*
paddingSAME*
strides
Ш
)sequential_1/conv5/BiasAdd/ReadVariableOpReadVariableOp2sequential_1_conv5_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0╢
sequential_1/conv5/BiasAddBiasAdd"sequential_1/conv5/Conv2D:output:01sequential_1/conv5/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:         @~
sequential_1/conv5/ReluRelu#sequential_1/conv5/BiasAdd:output:0*
T0*/
_output_shapes
:         @t
#sequential_1/upSamplingLayer3/ConstConst*
_output_shapes
:*
dtype0*
valueB"      v
%sequential_1/upSamplingLayer3/Const_1Const*
_output_shapes
:*
dtype0*
valueB"      л
!sequential_1/upSamplingLayer3/mulMul,sequential_1/upSamplingLayer3/Const:output:0.sequential_1/upSamplingLayer3/Const_1:output:0*
T0*
_output_shapes
:ї
:sequential_1/upSamplingLayer3/resize/ResizeNearestNeighborResizeNearestNeighbor%sequential_1/conv5/Relu:activations:0%sequential_1/upSamplingLayer3/mul:z:0*
T0*/
_output_shapes
:         @*
half_pixel_centers(в
(sequential_1/conv6/Conv2D/ReadVariableOpReadVariableOp1sequential_1_conv6_conv2d_readvariableop_resource*&
_output_shapes
:@*
dtype0Д
sequential_1/conv6/Conv2DConv2DKsequential_1/upSamplingLayer3/resize/ResizeNearestNeighbor:resized_images:00sequential_1/conv6/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:         *
paddingSAME*
strides
Ш
)sequential_1/conv6/BiasAdd/ReadVariableOpReadVariableOp2sequential_1_conv6_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0╢
sequential_1/conv6/BiasAddBiasAdd"sequential_1/conv6/Conv2D:output:01sequential_1/conv6/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:         ~
sequential_1/conv6/ReluRelu#sequential_1/conv6/BiasAdd:output:0*
T0*/
_output_shapes
:         в
(sequential_1/conv7/Conv2D/ReadVariableOpReadVariableOp1sequential_1_conv7_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0▐
sequential_1/conv7/Conv2DConv2D%sequential_1/conv6/Relu:activations:00sequential_1/conv7/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:         *
paddingSAME*
strides
Ш
)sequential_1/conv7/BiasAdd/ReadVariableOpReadVariableOp2sequential_1_conv7_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0╢
sequential_1/conv7/BiasAddBiasAdd"sequential_1/conv7/Conv2D:output:01sequential_1/conv7/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:         ~
sequential_1/conv7/ReluRelu#sequential_1/conv7/BiasAdd:output:0*
T0*/
_output_shapes
:         |
IdentityIdentity%sequential_1/conv7/Relu:activations:0^NoOp*
T0*/
_output_shapes
:         ╟
NoOpNoOp?^sequential/batch_normalization/FusedBatchNormV3/ReadVariableOpA^sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp_1.^sequential/batch_normalization/ReadVariableOp0^sequential/batch_normalization/ReadVariableOp_1(^sequential/conv1/BiasAdd/ReadVariableOp'^sequential/conv1/Conv2D/ReadVariableOp(^sequential/conv2/BiasAdd/ReadVariableOp'^sequential/conv2/Conv2D/ReadVariableOp(^sequential/dense/BiasAdd/ReadVariableOp'^sequential/dense/MatMul/ReadVariableOp)^sequential/dense1/BiasAdd/ReadVariableOp(^sequential/dense1/MatMul/ReadVariableOp*^sequential_1/conv5/BiasAdd/ReadVariableOp)^sequential_1/conv5/Conv2D/ReadVariableOp*^sequential_1/conv6/BiasAdd/ReadVariableOp)^sequential_1/conv6/Conv2D/ReadVariableOp*^sequential_1/conv7/BiasAdd/ReadVariableOp)^sequential_1/conv7/Conv2D/ReadVariableOp1^sequential_1/decodeLayer1/BiasAdd/ReadVariableOp0^sequential_1/decodeLayer1/MatMul/ReadVariableOp0^sequential_1/outputLayer/BiasAdd/ReadVariableOp/^sequential_1/outputLayer/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*Z
_input_shapesI
G:         : : : : : : : : : : : : : : : : : : : : : : 2А
>sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp>sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp2Д
@sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp_1@sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp_12^
-sequential/batch_normalization/ReadVariableOp-sequential/batch_normalization/ReadVariableOp2b
/sequential/batch_normalization/ReadVariableOp_1/sequential/batch_normalization/ReadVariableOp_12R
'sequential/conv1/BiasAdd/ReadVariableOp'sequential/conv1/BiasAdd/ReadVariableOp2P
&sequential/conv1/Conv2D/ReadVariableOp&sequential/conv1/Conv2D/ReadVariableOp2R
'sequential/conv2/BiasAdd/ReadVariableOp'sequential/conv2/BiasAdd/ReadVariableOp2P
&sequential/conv2/Conv2D/ReadVariableOp&sequential/conv2/Conv2D/ReadVariableOp2R
'sequential/dense/BiasAdd/ReadVariableOp'sequential/dense/BiasAdd/ReadVariableOp2P
&sequential/dense/MatMul/ReadVariableOp&sequential/dense/MatMul/ReadVariableOp2T
(sequential/dense1/BiasAdd/ReadVariableOp(sequential/dense1/BiasAdd/ReadVariableOp2R
'sequential/dense1/MatMul/ReadVariableOp'sequential/dense1/MatMul/ReadVariableOp2V
)sequential_1/conv5/BiasAdd/ReadVariableOp)sequential_1/conv5/BiasAdd/ReadVariableOp2T
(sequential_1/conv5/Conv2D/ReadVariableOp(sequential_1/conv5/Conv2D/ReadVariableOp2V
)sequential_1/conv6/BiasAdd/ReadVariableOp)sequential_1/conv6/BiasAdd/ReadVariableOp2T
(sequential_1/conv6/Conv2D/ReadVariableOp(sequential_1/conv6/Conv2D/ReadVariableOp2V
)sequential_1/conv7/BiasAdd/ReadVariableOp)sequential_1/conv7/BiasAdd/ReadVariableOp2T
(sequential_1/conv7/Conv2D/ReadVariableOp(sequential_1/conv7/Conv2D/ReadVariableOp2d
0sequential_1/decodeLayer1/BiasAdd/ReadVariableOp0sequential_1/decodeLayer1/BiasAdd/ReadVariableOp2b
/sequential_1/decodeLayer1/MatMul/ReadVariableOp/sequential_1/decodeLayer1/MatMul/ReadVariableOp2b
/sequential_1/outputLayer/BiasAdd/ReadVariableOp/sequential_1/outputLayer/BiasAdd/ReadVariableOp2`
.sequential_1/outputLayer/MatMul/ReadVariableOp.sequential_1/outputLayer/MatMul/ReadVariableOp:R N
/
_output_shapes
:         

_user_specified_namex
Ф
h
L__inference_upSamplingLayer2_layer_call_and_return_conditional_losses_350083

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:╜
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:V
ConstConst*
_output_shapes
:*
dtype0*
valueB"      W
mulMulstrided_slice:output:0Const:output:0*
T0*
_output_shapes
:╡
resize/ResizeNearestNeighborResizeNearestNeighborinputsmul:z:0*
T0*J
_output_shapes8
6:4                                    *
half_pixel_centers(Ш
IdentityIdentity-resize/ResizeNearestNeighbor:resized_images:0*
T0*J
_output_shapes8
6:4                                    "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4                                    :r n
J
_output_shapes8
6:4                                    
 
_user_specified_nameinputs
О

Є
A__inference_dense_layer_call_and_return_conditional_losses_349766

inputs0
matmul_readvariableop_resource:@-
biasadd_readvariableop_resource:
identityИвBiasAdd/ReadVariableOpвMatMul/ReadVariableOpt
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         P
TanhTanhBiasAdd:output:0*
T0*'
_output_shapes
:         W
IdentityIdentityTanh:y:0^NoOp*
T0*'
_output_shapes
:         w
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:         @: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
Й
с
)__inference_ae_mnist_layer_call_fn_350797
input_1!
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:#
	unknown_5: 
	unknown_6: 
	unknown_7:	а@
	unknown_8:@
	unknown_9:@

unknown_10:

unknown_11:@

unknown_12:@

unknown_13:	@И

unknown_14:	И$

unknown_15:@

unknown_16:@$

unknown_17:@

unknown_18:$

unknown_19:

unknown_20:
identityИвStatefulPartitionedCallБ
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20*"
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *6
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8В *M
fHRF
D__inference_ae_mnist_layer_call_and_return_conditional_losses_350701Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+                           `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*Z
_input_shapesI
G:         : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:         
!
_user_specified_name	input_1
Л
с
)__inference_ae_mnist_layer_call_fn_350600
input_1!
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:#
	unknown_5: 
	unknown_6: 
	unknown_7:	а@
	unknown_8:@
	unknown_9:@

unknown_10:

unknown_11:@

unknown_12:@

unknown_13:	@И

unknown_14:	И$

unknown_15:@

unknown_16:@$

unknown_17:@

unknown_18:$

unknown_19:

unknown_20:
identityИвStatefulPartitionedCallГ
StatefulPartitionedCallStatefulPartitionedCallinput_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20*"
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *8
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8В *M
fHRF
D__inference_ae_mnist_layer_call_and_return_conditional_losses_350553Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+                           `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*Z
_input_shapesI
G:         : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:X T
/
_output_shapes
:         
!
_user_specified_name	input_1
ж

·
G__inference_outputLayer_layer_call_and_return_conditional_losses_351877

inputs1
matmul_readvariableop_resource:	@И.
biasadd_readvariableop_resource:	И
identityИвBiasAdd/ReadVariableOpвMatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	@И*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:         Иs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:И*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ИQ
ReluReluBiasAdd:output:0*
T0*(
_output_shapes
:         Иb
IdentityIdentityRelu:activations:0^NoOp*
T0*(
_output_shapes
:         Иw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:         @: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
╓
a
C__inference_dropout_layer_call_and_return_conditional_losses_350134

inputs

identity_1N
IdentityIdentityinputs*
T0*'
_output_shapes
:         @[

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:         @"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:         @:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
А
·
A__inference_conv2_layer_call_and_return_conditional_losses_349716

inputs8
conv2d_readvariableop_resource: -
biasadd_readvariableop_resource: 
identityИвBiasAdd/ReadVariableOpвConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: *
dtype0Щ
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:          *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:          X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:          i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:          w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:         : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:         
 
_user_specified_nameinputs
д
B
&__inference_pool1_layer_call_fn_351697

inputs
identity╧
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *J
_output_shapes8
6:4                                    * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_pool1_layer_call_and_return_conditional_losses_349656Г
IdentityIdentityPartitionedCall:output:0*
T0*J
_output_shapes8
6:4                                    "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4                                    :r n
J
_output_shapes8
6:4                                    
 
_user_specified_nameinputs
Ю)
у
F__inference_sequential_layer_call_and_return_conditional_losses_349937

inputs&
conv1_349903:
conv1_349905:(
batch_normalization_349908:(
batch_normalization_349910:(
batch_normalization_349912:(
batch_normalization_349914:&
conv2_349918: 
conv2_349920:  
dense1_349925:	а@
dense1_349927:@
dense_349931:@
dense_349933:
identityИв+batch_normalization/StatefulPartitionedCallвconv1/StatefulPartitionedCallвconv2/StatefulPartitionedCallвdense/StatefulPartitionedCallвdense1/StatefulPartitionedCallв!predense2/StatefulPartitionedCallь
conv1/StatefulPartitionedCallStatefulPartitionedCallinputsconv1_349903conv1_349905*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv1_layer_call_and_return_conditional_losses_349689■
+batch_normalization/StatefulPartitionedCallStatefulPartitionedCall&conv1/StatefulPartitionedCall:output:0batch_normalization_349908batch_normalization_349910batch_normalization_349912batch_normalization_349914*
Tin	
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *X
fSRQ
O__inference_batch_normalization_layer_call_and_return_conditional_losses_349636ш
pool1/PartitionedCallPartitionedCall4batch_normalization/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:         * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_pool1_layer_call_and_return_conditional_losses_349656Д
conv2/StatefulPartitionedCallStatefulPartitionedCallpool1/PartitionedCall:output:0conv2_349918conv2_349920*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:          *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv2_layer_call_and_return_conditional_losses_349716┌
pool2/PartitionedCallPartitionedCall&conv2/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:          * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_pool2_layer_call_and_return_conditional_losses_349668╙
predense1/PartitionedCallPartitionedCallpool2/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         а* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_predense1_layer_call_and_return_conditional_losses_349729Д
dense1/StatefulPartitionedCallStatefulPartitionedCall"predense1/PartitionedCall:output:0dense1_349925dense1_349927*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense1_layer_call_and_return_conditional_losses_349742ы
!predense2/StatefulPartitionedCallStatefulPartitionedCall'dense1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_predense2_layer_call_and_return_conditional_losses_349830И
dense/StatefulPartitionedCallStatefulPartitionedCall*predense2/StatefulPartitionedCall:output:0dense_349931dense_349933*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_dense_layer_call_and_return_conditional_losses_349766u
IdentityIdentity&dense/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         Щ
NoOpNoOp,^batch_normalization/StatefulPartitionedCall^conv1/StatefulPartitionedCall^conv2/StatefulPartitionedCall^dense/StatefulPartitionedCall^dense1/StatefulPartitionedCall"^predense2/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*F
_input_shapes5
3:         : : : : : : : : : : : : 2Z
+batch_normalization/StatefulPartitionedCall+batch_normalization/StatefulPartitionedCall2>
conv1/StatefulPartitionedCallconv1/StatefulPartitionedCall2>
conv2/StatefulPartitionedCallconv2/StatefulPartitionedCall2>
dense/StatefulPartitionedCalldense/StatefulPartitionedCall2@
dense1/StatefulPartitionedCalldense1/StatefulPartitionedCall2F
!predense2/StatefulPartitionedCall!predense2/StatefulPartitionedCall:W S
/
_output_shapes
:         
 
_user_specified_nameinputs
Ф
h
L__inference_upSamplingLayer3_layer_call_and_return_conditional_losses_350102

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:╜
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
:V
ConstConst*
_output_shapes
:*
dtype0*
valueB"      W
mulMulstrided_slice:output:0Const:output:0*
T0*
_output_shapes
:╡
resize/ResizeNearestNeighborResizeNearestNeighborinputsmul:z:0*
T0*J
_output_shapes8
6:4                                    *
half_pixel_centers(Ш
IdentityIdentity-resize/ResizeNearestNeighbor:resized_images:0*
T0*J
_output_shapes8
6:4                                    "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4                                    :r n
J
_output_shapes8
6:4                                    
 
_user_specified_nameinputs
╙)
в
H__inference_sequential_1_layer_call_and_return_conditional_losses_350499
decodelayer1_input%
decodelayer1_350469:@!
decodelayer1_350471:@%
outputlayer_350475:	@И!
outputlayer_350477:	И&
conv5_350482:@
conv5_350484:@&
conv6_350488:@
conv6_350490:&
conv7_350493:
conv7_350495:
identityИвconv5/StatefulPartitionedCallвconv6/StatefulPartitionedCallвconv7/StatefulPartitionedCallв$decodeLayer1/StatefulPartitionedCallвdropout/StatefulPartitionedCallв#outputLayer/StatefulPartitionedCallМ
$decodeLayer1/StatefulPartitionedCallStatefulPartitionedCalldecodelayer1_inputdecodelayer1_350469decodelayer1_350471*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_decodeLayer1_layer_call_and_return_conditional_losses_350123э
dropout/StatefulPartitionedCallStatefulPartitionedCall-decodeLayer1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_350312Я
#outputLayer/StatefulPartitionedCallStatefulPartitionedCall(dropout/StatefulPartitionedCall:output:0outputlayer_350475outputlayer_350477*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         И*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *P
fKRI
G__inference_outputLayer_layer_call_and_return_conditional_losses_350147ю
reshapeLayer/PartitionedCallPartitionedCall,outputLayer/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:         * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_reshapeLayer_layer_call_and_return_conditional_losses_350167Б
 upSamplingLayer2/PartitionedCallPartitionedCall%reshapeLayer/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *U
fPRN
L__inference_upSamplingLayer2_layer_call_and_return_conditional_losses_350083б
conv5/StatefulPartitionedCallStatefulPartitionedCall)upSamplingLayer2/PartitionedCall:output:0conv5_350482conv5_350484*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           @*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv5_layer_call_and_return_conditional_losses_350181В
 upSamplingLayer3/PartitionedCallPartitionedCall&conv5/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           @* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *U
fPRN
L__inference_upSamplingLayer3_layer_call_and_return_conditional_losses_350102б
conv6/StatefulPartitionedCallStatefulPartitionedCall)upSamplingLayer3/PartitionedCall:output:0conv6_350488conv6_350490*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv6_layer_call_and_return_conditional_losses_350199Ю
conv7/StatefulPartitionedCallStatefulPartitionedCall&conv6/StatefulPartitionedCall:output:0conv7_350493conv7_350495*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv7_layer_call_and_return_conditional_losses_350216П
IdentityIdentity&conv7/StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+                           Х
NoOpNoOp^conv5/StatefulPartitionedCall^conv6/StatefulPartitionedCall^conv7/StatefulPartitionedCall%^decodeLayer1/StatefulPartitionedCall ^dropout/StatefulPartitionedCall$^outputLayer/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':         : : : : : : : : : : 2>
conv5/StatefulPartitionedCallconv5/StatefulPartitionedCall2>
conv6/StatefulPartitionedCallconv6/StatefulPartitionedCall2>
conv7/StatefulPartitionedCallconv7/StatefulPartitionedCall2L
$decodeLayer1/StatefulPartitionedCall$decodeLayer1/StatefulPartitionedCall2B
dropout/StatefulPartitionedCalldropout/StatefulPartitionedCall2J
#outputLayer/StatefulPartitionedCall#outputLayer/StatefulPartitionedCall:[ W
'
_output_shapes
:         
,
_user_specified_namedecodeLayer1_input
Г
░
+__inference_sequential_layer_call_fn_351328

inputs!
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:#
	unknown_5: 
	unknown_6: 
	unknown_7:	а@
	unknown_8:@
	unknown_9:@

unknown_10:
identityИвStatefulPartitionedCall▄
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8В *O
fJRH
F__inference_sequential_layer_call_and_return_conditional_losses_349937o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*F
_input_shapes5
3:         : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:         
 
_user_specified_nameinputs
Т
╡
+__inference_sequential_layer_call_fn_349993
conv1_input!
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:#
	unknown_5: 
	unknown_6: 
	unknown_7:	а@
	unknown_8:@
	unknown_9:@

unknown_10:
identityИвStatefulPartitionedCallс
StatefulPartitionedCallStatefulPartitionedCallconv1_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8В *O
fJRH
F__inference_sequential_layer_call_and_return_conditional_losses_349937o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*F
_input_shapes5
3:         : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
/
_output_shapes
:         
%
_user_specified_nameconv1_input
╟
a
E__inference_predense1_layer_call_and_return_conditional_losses_351743

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"       ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:         аY
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:         а"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:          :W S
/
_output_shapes
:          
 
_user_specified_nameinputs
°U
╤
"__inference__traced_restore_352155
file_prefix7
assignvariableop_conv1_kernel:+
assignvariableop_1_conv1_bias::
,assignvariableop_2_batch_normalization_gamma:9
+assignvariableop_3_batch_normalization_beta:@
2assignvariableop_4_batch_normalization_moving_mean:D
6assignvariableop_5_batch_normalization_moving_variance:9
assignvariableop_6_conv2_kernel: +
assignvariableop_7_conv2_bias: 3
 assignvariableop_8_dense1_kernel:	а@,
assignvariableop_9_dense1_bias:@2
 assignvariableop_10_dense_kernel:@,
assignvariableop_11_dense_bias:9
'assignvariableop_12_decodelayer1_kernel:@3
%assignvariableop_13_decodelayer1_bias:@9
&assignvariableop_14_outputlayer_kernel:	@И3
$assignvariableop_15_outputlayer_bias:	И:
 assignvariableop_16_conv5_kernel:@,
assignvariableop_17_conv5_bias:@:
 assignvariableop_18_conv6_kernel:@,
assignvariableop_19_conv6_bias::
 assignvariableop_20_conv7_kernel:,
assignvariableop_21_conv7_bias:
identity_23ИвAssignVariableOpвAssignVariableOp_1вAssignVariableOp_10вAssignVariableOp_11вAssignVariableOp_12вAssignVariableOp_13вAssignVariableOp_14вAssignVariableOp_15вAssignVariableOp_16вAssignVariableOp_17вAssignVariableOp_18вAssignVariableOp_19вAssignVariableOp_2вAssignVariableOp_20вAssignVariableOp_21вAssignVariableOp_3вAssignVariableOp_4вAssignVariableOp_5вAssignVariableOp_6вAssignVariableOp_7вAssignVariableOp_8вAssignVariableOp_9Й
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*п
valueеBвB&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB&variables/7/.ATTRIBUTES/VARIABLE_VALUEB&variables/8/.ATTRIBUTES/VARIABLE_VALUEB&variables/9/.ATTRIBUTES/VARIABLE_VALUEB'variables/10/.ATTRIBUTES/VARIABLE_VALUEB'variables/11/.ATTRIBUTES/VARIABLE_VALUEB'variables/12/.ATTRIBUTES/VARIABLE_VALUEB'variables/13/.ATTRIBUTES/VARIABLE_VALUEB'variables/14/.ATTRIBUTES/VARIABLE_VALUEB'variables/15/.ATTRIBUTES/VARIABLE_VALUEB'variables/16/.ATTRIBUTES/VARIABLE_VALUEB'variables/17/.ATTRIBUTES/VARIABLE_VALUEB'variables/18/.ATTRIBUTES/VARIABLE_VALUEB'variables/19/.ATTRIBUTES/VARIABLE_VALUEB'variables/20/.ATTRIBUTES/VARIABLE_VALUEB'variables/21/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPHЮ
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*A
value8B6B B B B B B B B B B B B B B B B B B B B B B B С
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*p
_output_shapes^
\:::::::::::::::::::::::*%
dtypes
2[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:И
AssignVariableOpAssignVariableOpassignvariableop_conv1_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:М
AssignVariableOp_1AssignVariableOpassignvariableop_1_conv1_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:Ы
AssignVariableOp_2AssignVariableOp,assignvariableop_2_batch_normalization_gammaIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:Ъ
AssignVariableOp_3AssignVariableOp+assignvariableop_3_batch_normalization_betaIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:б
AssignVariableOp_4AssignVariableOp2assignvariableop_4_batch_normalization_moving_meanIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:е
AssignVariableOp_5AssignVariableOp6assignvariableop_5_batch_normalization_moving_varianceIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:О
AssignVariableOp_6AssignVariableOpassignvariableop_6_conv2_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:М
AssignVariableOp_7AssignVariableOpassignvariableop_7_conv2_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:П
AssignVariableOp_8AssignVariableOp assignvariableop_8_dense1_kernelIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:Н
AssignVariableOp_9AssignVariableOpassignvariableop_9_dense1_biasIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:С
AssignVariableOp_10AssignVariableOp assignvariableop_10_dense_kernelIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:П
AssignVariableOp_11AssignVariableOpassignvariableop_11_dense_biasIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:Ш
AssignVariableOp_12AssignVariableOp'assignvariableop_12_decodelayer1_kernelIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:Ц
AssignVariableOp_13AssignVariableOp%assignvariableop_13_decodelayer1_biasIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:Ч
AssignVariableOp_14AssignVariableOp&assignvariableop_14_outputlayer_kernelIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:Х
AssignVariableOp_15AssignVariableOp$assignvariableop_15_outputlayer_biasIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:С
AssignVariableOp_16AssignVariableOp assignvariableop_16_conv5_kernelIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:П
AssignVariableOp_17AssignVariableOpassignvariableop_17_conv5_biasIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0*
_output_shapes
:С
AssignVariableOp_18AssignVariableOp assignvariableop_18_conv6_kernelIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:П
AssignVariableOp_19AssignVariableOpassignvariableop_19_conv6_biasIdentity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:С
AssignVariableOp_20AssignVariableOp assignvariableop_20_conv7_kernelIdentity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype0_
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:П
AssignVariableOp_21AssignVariableOpassignvariableop_21_conv7_biasIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 │
Identity_22Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: W
Identity_23IdentityIdentity_22:output:0^NoOp_1*
T0*
_output_shapes
: а
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^AssignVariableOp_6^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 "#
identity_23Identity_23:output:0*A
_input_shapes0
.: : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_52(
AssignVariableOp_6AssignVariableOp_62(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
╪
c
E__inference_predense2_layer_call_and_return_conditional_losses_349753

inputs

identity_1N
IdentityIdentityinputs*
T0*'
_output_shapes
:         @[

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:         @"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:         @:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
╪
c
E__inference_predense2_layer_call_and_return_conditional_losses_351778

inputs

identity_1N
IdentityIdentityinputs*
T0*'
_output_shapes
:         @[

Identity_1IdentityIdentity:output:0*
T0*'
_output_shapes
:         @"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:         @:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
│(
А
H__inference_sequential_1_layer_call_and_return_conditional_losses_350466
decodelayer1_input%
decodelayer1_350436:@!
decodelayer1_350438:@%
outputlayer_350442:	@И!
outputlayer_350444:	И&
conv5_350449:@
conv5_350451:@&
conv6_350455:@
conv6_350457:&
conv7_350460:
conv7_350462:
identityИвconv5/StatefulPartitionedCallвconv6/StatefulPartitionedCallвconv7/StatefulPartitionedCallв$decodeLayer1/StatefulPartitionedCallв#outputLayer/StatefulPartitionedCallМ
$decodeLayer1/StatefulPartitionedCallStatefulPartitionedCalldecodelayer1_inputdecodelayer1_350436decodelayer1_350438*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_decodeLayer1_layer_call_and_return_conditional_losses_350123▌
dropout/PartitionedCallPartitionedCall-decodeLayer1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_350134Ч
#outputLayer/StatefulPartitionedCallStatefulPartitionedCall dropout/PartitionedCall:output:0outputlayer_350442outputlayer_350444*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         И*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *P
fKRI
G__inference_outputLayer_layer_call_and_return_conditional_losses_350147ю
reshapeLayer/PartitionedCallPartitionedCall,outputLayer/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:         * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_reshapeLayer_layer_call_and_return_conditional_losses_350167Б
 upSamplingLayer2/PartitionedCallPartitionedCall%reshapeLayer/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *U
fPRN
L__inference_upSamplingLayer2_layer_call_and_return_conditional_losses_350083б
conv5/StatefulPartitionedCallStatefulPartitionedCall)upSamplingLayer2/PartitionedCall:output:0conv5_350449conv5_350451*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           @*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv5_layer_call_and_return_conditional_losses_350181В
 upSamplingLayer3/PartitionedCallPartitionedCall&conv5/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           @* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *U
fPRN
L__inference_upSamplingLayer3_layer_call_and_return_conditional_losses_350102б
conv6/StatefulPartitionedCallStatefulPartitionedCall)upSamplingLayer3/PartitionedCall:output:0conv6_350455conv6_350457*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv6_layer_call_and_return_conditional_losses_350199Ю
conv7/StatefulPartitionedCallStatefulPartitionedCall&conv6/StatefulPartitionedCall:output:0conv7_350460conv7_350462*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv7_layer_call_and_return_conditional_losses_350216П
IdentityIdentity&conv7/StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+                           є
NoOpNoOp^conv5/StatefulPartitionedCall^conv6/StatefulPartitionedCall^conv7/StatefulPartitionedCall%^decodeLayer1/StatefulPartitionedCall$^outputLayer/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':         : : : : : : : : : : 2>
conv5/StatefulPartitionedCallconv5/StatefulPartitionedCall2>
conv6/StatefulPartitionedCallconv6/StatefulPartitionedCall2>
conv7/StatefulPartitionedCallconv7/StatefulPartitionedCall2L
$decodeLayer1/StatefulPartitionedCall$decodeLayer1/StatefulPartitionedCall2J
#outputLayer/StatefulPartitionedCall#outputLayer/StatefulPartitionedCall:[ W
'
_output_shapes
:         
,
_user_specified_namedecodeLayer1_input
Й
]
A__inference_pool2_layer_call_and_return_conditional_losses_351732

inputs
identityв
MaxPoolMaxPoolinputs*J
_output_shapes8
6:4                                    *
ksize
*
paddingVALID*
strides
{
IdentityIdentityMaxPool:output:0*
T0*J
_output_shapes8
6:4                                    "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4                                    :r n
J
_output_shapes8
6:4                                    
 
_user_specified_nameinputs
∙
щ
D__inference_ae_mnist_layer_call_and_return_conditional_losses_350847
input_1+
sequential_350800:
sequential_350802:
sequential_350804:
sequential_350806:
sequential_350808:
sequential_350810:+
sequential_350812: 
sequential_350814: $
sequential_350816:	а@
sequential_350818:@#
sequential_350820:@
sequential_350822:%
sequential_1_350825:@!
sequential_1_350827:@&
sequential_1_350829:	@И"
sequential_1_350831:	И-
sequential_1_350833:@!
sequential_1_350835:@-
sequential_1_350837:@!
sequential_1_350839:-
sequential_1_350841:!
sequential_1_350843:
identityИв"sequential/StatefulPartitionedCallв$sequential_1/StatefulPartitionedCall╦
"sequential/StatefulPartitionedCallStatefulPartitionedCallinput_1sequential_350800sequential_350802sequential_350804sequential_350806sequential_350808sequential_350810sequential_350812sequential_350814sequential_350816sequential_350818sequential_350820sequential_350822*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *.
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8В *O
fJRH
F__inference_sequential_layer_call_and_return_conditional_losses_349773ў
$sequential_1/StatefulPartitionedCallStatefulPartitionedCall+sequential/StatefulPartitionedCall:output:0sequential_1_350825sequential_1_350827sequential_1_350829sequential_1_350831sequential_1_350833sequential_1_350835sequential_1_350837sequential_1_350839sequential_1_350841sequential_1_350843*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_sequential_1_layer_call_and_return_conditional_losses_350223Ц
IdentityIdentity-sequential_1/StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+                           Т
NoOpNoOp#^sequential/StatefulPartitionedCall%^sequential_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*Z
_input_shapesI
G:         : : : : : : : : : : : : : : : : : : : : : : 2H
"sequential/StatefulPartitionedCall"sequential/StatefulPartitionedCall2L
$sequential_1/StatefulPartitionedCall$sequential_1/StatefulPartitionedCall:X T
/
_output_shapes
:         
!
_user_specified_name	input_1
ё	
b
C__inference_dropout_layer_call_and_return_conditional_losses_351857

inputs
identityИR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  а?d
dropout/MulMulinputsdropout/Const:output:0*
T0*'
_output_shapes
:         @C
dropout/ShapeShapeinputs*
T0*
_output_shapes
:М
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*'
_output_shapes
:         @*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *═╠L>ж
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:         @o
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:         @i
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*'
_output_shapes
:         @Y
IdentityIdentitydropout/Mul_1:z:0*
T0*'
_output_shapes
:         @"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:         @:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
н
Ы
&__inference_conv6_layer_call_fn_351959

inputs!
unknown:@
	unknown_0:
identityИвStatefulPartitionedCallЁ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv6_layer_call_and_return_conditional_losses_350199Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+                           `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+                           @: : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+                           @
 
_user_specified_nameinputs
Й
]
A__inference_pool2_layer_call_and_return_conditional_losses_349668

inputs
identityв
MaxPoolMaxPoolinputs*J
_output_shapes8
6:4                                    *
ksize
*
paddingVALID*
strides
{
IdentityIdentityMaxPool:output:0*
T0*J
_output_shapes8
6:4                                    "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4                                    :r n
J
_output_shapes8
6:4                                    
 
_user_specified_nameinputs
Й
]
A__inference_pool1_layer_call_and_return_conditional_losses_351702

inputs
identityв
MaxPoolMaxPoolinputs*J
_output_shapes8
6:4                                    *
ksize
*
paddingVALID*
strides
{
IdentityIdentityMaxPool:output:0*
T0*J
_output_shapes8
6:4                                    "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4                                    :r n
J
_output_shapes8
6:4                                    
 
_user_specified_nameinputs
Н	
╧
4__inference_batch_normalization_layer_call_fn_351643

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identityИвStatefulPartitionedCallШ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *&
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *X
fSRQ
O__inference_batch_normalization_layer_call_and_return_conditional_losses_349605Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+                           `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+                           : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+                           
 
_user_specified_nameinputs
═9
ю	
F__inference_sequential_layer_call_and_return_conditional_losses_351379

inputs>
$conv1_conv2d_readvariableop_resource:3
%conv1_biasadd_readvariableop_resource:9
+batch_normalization_readvariableop_resource:;
-batch_normalization_readvariableop_1_resource:J
<batch_normalization_fusedbatchnormv3_readvariableop_resource:L
>batch_normalization_fusedbatchnormv3_readvariableop_1_resource:>
$conv2_conv2d_readvariableop_resource: 3
%conv2_biasadd_readvariableop_resource: 8
%dense1_matmul_readvariableop_resource:	а@4
&dense1_biasadd_readvariableop_resource:@6
$dense_matmul_readvariableop_resource:@3
%dense_biasadd_readvariableop_resource:
identityИв3batch_normalization/FusedBatchNormV3/ReadVariableOpв5batch_normalization/FusedBatchNormV3/ReadVariableOp_1в"batch_normalization/ReadVariableOpв$batch_normalization/ReadVariableOp_1вconv1/BiasAdd/ReadVariableOpвconv1/Conv2D/ReadVariableOpвconv2/BiasAdd/ReadVariableOpвconv2/Conv2D/ReadVariableOpвdense/BiasAdd/ReadVariableOpвdense/MatMul/ReadVariableOpвdense1/BiasAdd/ReadVariableOpвdense1/MatMul/ReadVariableOpИ
conv1/Conv2D/ReadVariableOpReadVariableOp$conv1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0е
conv1/Conv2DConv2Dinputs#conv1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:         *
paddingSAME*
strides
~
conv1/BiasAdd/ReadVariableOpReadVariableOp%conv1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0П
conv1/BiasAddBiasAddconv1/Conv2D:output:0$conv1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:         d

conv1/ReluReluconv1/BiasAdd:output:0*
T0*/
_output_shapes
:         К
"batch_normalization/ReadVariableOpReadVariableOp+batch_normalization_readvariableop_resource*
_output_shapes
:*
dtype0О
$batch_normalization/ReadVariableOp_1ReadVariableOp-batch_normalization_readvariableop_1_resource*
_output_shapes
:*
dtype0м
3batch_normalization/FusedBatchNormV3/ReadVariableOpReadVariableOp<batch_normalization_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0░
5batch_normalization/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp>batch_normalization_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0м
$batch_normalization/FusedBatchNormV3FusedBatchNormV3conv1/Relu:activations:0*batch_normalization/ReadVariableOp:value:0,batch_normalization/ReadVariableOp_1:value:0;batch_normalization/FusedBatchNormV3/ReadVariableOp:value:0=batch_normalization/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:         :::::*
epsilon%oГ:*
is_training( п
pool1/MaxPoolMaxPool(batch_normalization/FusedBatchNormV3:y:0*/
_output_shapes
:         *
ksize
*
paddingVALID*
strides
И
conv2/Conv2D/ReadVariableOpReadVariableOp$conv2_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0╡
conv2/Conv2DConv2Dpool1/MaxPool:output:0#conv2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:          *
paddingSAME*
strides
~
conv2/BiasAdd/ReadVariableOpReadVariableOp%conv2_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0П
conv2/BiasAddBiasAddconv2/Conv2D:output:0$conv2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:          d

conv2/ReluReluconv2/BiasAdd:output:0*
T0*/
_output_shapes
:          Я
pool2/MaxPoolMaxPoolconv2/Relu:activations:0*/
_output_shapes
:          *
ksize
*
paddingVALID*
strides
`
predense1/ConstConst*
_output_shapes
:*
dtype0*
valueB"       Б
predense1/ReshapeReshapepool2/MaxPool:output:0predense1/Const:output:0*
T0*(
_output_shapes
:         аГ
dense1/MatMul/ReadVariableOpReadVariableOp%dense1_matmul_readvariableop_resource*
_output_shapes
:	а@*
dtype0Л
dense1/MatMulMatMulpredense1/Reshape:output:0$dense1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @А
dense1/BiasAdd/ReadVariableOpReadVariableOp&dense1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Л
dense1/BiasAddBiasAdddense1/MatMul:product:0%dense1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @^
dense1/ReluReludense1/BiasAdd:output:0*
T0*'
_output_shapes
:         @k
predense2/IdentityIdentitydense1/Relu:activations:0*
T0*'
_output_shapes
:         @А
dense/MatMul/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource*
_output_shapes

:@*
dtype0К
dense/MatMulMatMulpredense2/Identity:output:0#dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         ~
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0И
dense/BiasAddBiasAdddense/MatMul:product:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         \

dense/TanhTanhdense/BiasAdd:output:0*
T0*'
_output_shapes
:         ]
IdentityIdentitydense/Tanh:y:0^NoOp*
T0*'
_output_shapes
:         Ў
NoOpNoOp4^batch_normalization/FusedBatchNormV3/ReadVariableOp6^batch_normalization/FusedBatchNormV3/ReadVariableOp_1#^batch_normalization/ReadVariableOp%^batch_normalization/ReadVariableOp_1^conv1/BiasAdd/ReadVariableOp^conv1/Conv2D/ReadVariableOp^conv2/BiasAdd/ReadVariableOp^conv2/Conv2D/ReadVariableOp^dense/BiasAdd/ReadVariableOp^dense/MatMul/ReadVariableOp^dense1/BiasAdd/ReadVariableOp^dense1/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*F
_input_shapes5
3:         : : : : : : : : : : : : 2j
3batch_normalization/FusedBatchNormV3/ReadVariableOp3batch_normalization/FusedBatchNormV3/ReadVariableOp2n
5batch_normalization/FusedBatchNormV3/ReadVariableOp_15batch_normalization/FusedBatchNormV3/ReadVariableOp_12H
"batch_normalization/ReadVariableOp"batch_normalization/ReadVariableOp2L
$batch_normalization/ReadVariableOp_1$batch_normalization/ReadVariableOp_12<
conv1/BiasAdd/ReadVariableOpconv1/BiasAdd/ReadVariableOp2:
conv1/Conv2D/ReadVariableOpconv1/Conv2D/ReadVariableOp2<
conv2/BiasAdd/ReadVariableOpconv2/BiasAdd/ReadVariableOp2:
conv2/Conv2D/ReadVariableOpconv2/Conv2D/ReadVariableOp2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2:
dense/MatMul/ReadVariableOpdense/MatMul/ReadVariableOp2>
dense1/BiasAdd/ReadVariableOpdense1/BiasAdd/ReadVariableOp2<
dense1/MatMul/ReadVariableOpdense1/MatMul/ReadVariableOp:W S
/
_output_shapes
:         
 
_user_specified_nameinputs
А
·
A__inference_conv2_layer_call_and_return_conditional_losses_351722

inputs8
conv2d_readvariableop_resource: -
biasadd_readvariableop_resource: 
identityИвBiasAdd/ReadVariableOpвConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
: *
dtype0Щ
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:          *
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype0}
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:          X
ReluReluBiasAdd:output:0*
T0*/
_output_shapes
:          i
IdentityIdentityRelu:activations:0^NoOp*
T0*/
_output_shapes
:          w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:         : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:W S
/
_output_shapes
:         
 
_user_specified_nameinputs
ЙH
║

F__inference_sequential_layer_call_and_return_conditional_losses_351437

inputs>
$conv1_conv2d_readvariableop_resource:3
%conv1_biasadd_readvariableop_resource:9
+batch_normalization_readvariableop_resource:;
-batch_normalization_readvariableop_1_resource:J
<batch_normalization_fusedbatchnormv3_readvariableop_resource:L
>batch_normalization_fusedbatchnormv3_readvariableop_1_resource:>
$conv2_conv2d_readvariableop_resource: 3
%conv2_biasadd_readvariableop_resource: 8
%dense1_matmul_readvariableop_resource:	а@4
&dense1_biasadd_readvariableop_resource:@6
$dense_matmul_readvariableop_resource:@3
%dense_biasadd_readvariableop_resource:
identityИв"batch_normalization/AssignNewValueв$batch_normalization/AssignNewValue_1в3batch_normalization/FusedBatchNormV3/ReadVariableOpв5batch_normalization/FusedBatchNormV3/ReadVariableOp_1в"batch_normalization/ReadVariableOpв$batch_normalization/ReadVariableOp_1вconv1/BiasAdd/ReadVariableOpвconv1/Conv2D/ReadVariableOpвconv2/BiasAdd/ReadVariableOpвconv2/Conv2D/ReadVariableOpвdense/BiasAdd/ReadVariableOpвdense/MatMul/ReadVariableOpвdense1/BiasAdd/ReadVariableOpвdense1/MatMul/ReadVariableOpИ
conv1/Conv2D/ReadVariableOpReadVariableOp$conv1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0е
conv1/Conv2DConv2Dinputs#conv1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:         *
paddingSAME*
strides
~
conv1/BiasAdd/ReadVariableOpReadVariableOp%conv1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0П
conv1/BiasAddBiasAddconv1/Conv2D:output:0$conv1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:         d

conv1/ReluReluconv1/BiasAdd:output:0*
T0*/
_output_shapes
:         К
"batch_normalization/ReadVariableOpReadVariableOp+batch_normalization_readvariableop_resource*
_output_shapes
:*
dtype0О
$batch_normalization/ReadVariableOp_1ReadVariableOp-batch_normalization_readvariableop_1_resource*
_output_shapes
:*
dtype0м
3batch_normalization/FusedBatchNormV3/ReadVariableOpReadVariableOp<batch_normalization_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0░
5batch_normalization/FusedBatchNormV3/ReadVariableOp_1ReadVariableOp>batch_normalization_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0║
$batch_normalization/FusedBatchNormV3FusedBatchNormV3conv1/Relu:activations:0*batch_normalization/ReadVariableOp:value:0,batch_normalization/ReadVariableOp_1:value:0;batch_normalization/FusedBatchNormV3/ReadVariableOp:value:0=batch_normalization/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:         :::::*
epsilon%oГ:*
exponential_avg_factor%
╫#<Ц
"batch_normalization/AssignNewValueAssignVariableOp<batch_normalization_fusedbatchnormv3_readvariableop_resource1batch_normalization/FusedBatchNormV3:batch_mean:04^batch_normalization/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0*
validate_shape(а
$batch_normalization/AssignNewValue_1AssignVariableOp>batch_normalization_fusedbatchnormv3_readvariableop_1_resource5batch_normalization/FusedBatchNormV3:batch_variance:06^batch_normalization/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0*
validate_shape(п
pool1/MaxPoolMaxPool(batch_normalization/FusedBatchNormV3:y:0*/
_output_shapes
:         *
ksize
*
paddingVALID*
strides
И
conv2/Conv2D/ReadVariableOpReadVariableOp$conv2_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0╡
conv2/Conv2DConv2Dpool1/MaxPool:output:0#conv2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:          *
paddingSAME*
strides
~
conv2/BiasAdd/ReadVariableOpReadVariableOp%conv2_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0П
conv2/BiasAddBiasAddconv2/Conv2D:output:0$conv2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:          d

conv2/ReluReluconv2/BiasAdd:output:0*
T0*/
_output_shapes
:          Я
pool2/MaxPoolMaxPoolconv2/Relu:activations:0*/
_output_shapes
:          *
ksize
*
paddingVALID*
strides
`
predense1/ConstConst*
_output_shapes
:*
dtype0*
valueB"       Б
predense1/ReshapeReshapepool2/MaxPool:output:0predense1/Const:output:0*
T0*(
_output_shapes
:         аГ
dense1/MatMul/ReadVariableOpReadVariableOp%dense1_matmul_readvariableop_resource*
_output_shapes
:	а@*
dtype0Л
dense1/MatMulMatMulpredense1/Reshape:output:0$dense1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @А
dense1/BiasAdd/ReadVariableOpReadVariableOp&dense1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Л
dense1/BiasAddBiasAdddense1/MatMul:product:0%dense1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @^
dense1/ReluReludense1/BiasAdd:output:0*
T0*'
_output_shapes
:         @\
predense2/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  а?Л
predense2/dropout/MulMuldense1/Relu:activations:0 predense2/dropout/Const:output:0*
T0*'
_output_shapes
:         @`
predense2/dropout/ShapeShapedense1/Relu:activations:0*
T0*
_output_shapes
:а
.predense2/dropout/random_uniform/RandomUniformRandomUniform predense2/dropout/Shape:output:0*
T0*'
_output_shapes
:         @*
dtype0e
 predense2/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *═╠L>─
predense2/dropout/GreaterEqualGreaterEqual7predense2/dropout/random_uniform/RandomUniform:output:0)predense2/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:         @Г
predense2/dropout/CastCast"predense2/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:         @З
predense2/dropout/Mul_1Mulpredense2/dropout/Mul:z:0predense2/dropout/Cast:y:0*
T0*'
_output_shapes
:         @А
dense/MatMul/ReadVariableOpReadVariableOp$dense_matmul_readvariableop_resource*
_output_shapes

:@*
dtype0К
dense/MatMulMatMulpredense2/dropout/Mul_1:z:0#dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         ~
dense/BiasAdd/ReadVariableOpReadVariableOp%dense_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0И
dense/BiasAddBiasAdddense/MatMul:product:0$dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         \

dense/TanhTanhdense/BiasAdd:output:0*
T0*'
_output_shapes
:         ]
IdentityIdentitydense/Tanh:y:0^NoOp*
T0*'
_output_shapes
:         ┬
NoOpNoOp#^batch_normalization/AssignNewValue%^batch_normalization/AssignNewValue_14^batch_normalization/FusedBatchNormV3/ReadVariableOp6^batch_normalization/FusedBatchNormV3/ReadVariableOp_1#^batch_normalization/ReadVariableOp%^batch_normalization/ReadVariableOp_1^conv1/BiasAdd/ReadVariableOp^conv1/Conv2D/ReadVariableOp^conv2/BiasAdd/ReadVariableOp^conv2/Conv2D/ReadVariableOp^dense/BiasAdd/ReadVariableOp^dense/MatMul/ReadVariableOp^dense1/BiasAdd/ReadVariableOp^dense1/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*F
_input_shapes5
3:         : : : : : : : : : : : : 2H
"batch_normalization/AssignNewValue"batch_normalization/AssignNewValue2L
$batch_normalization/AssignNewValue_1$batch_normalization/AssignNewValue_12j
3batch_normalization/FusedBatchNormV3/ReadVariableOp3batch_normalization/FusedBatchNormV3/ReadVariableOp2n
5batch_normalization/FusedBatchNormV3/ReadVariableOp_15batch_normalization/FusedBatchNormV3/ReadVariableOp_12H
"batch_normalization/ReadVariableOp"batch_normalization/ReadVariableOp2L
$batch_normalization/ReadVariableOp_1$batch_normalization/ReadVariableOp_12<
conv1/BiasAdd/ReadVariableOpconv1/BiasAdd/ReadVariableOp2:
conv1/Conv2D/ReadVariableOpconv1/Conv2D/ReadVariableOp2<
conv2/BiasAdd/ReadVariableOpconv2/BiasAdd/ReadVariableOp2:
conv2/Conv2D/ReadVariableOpconv2/Conv2D/ReadVariableOp2<
dense/BiasAdd/ReadVariableOpdense/BiasAdd/ReadVariableOp2:
dense/MatMul/ReadVariableOpdense/MatMul/ReadVariableOp2>
dense1/BiasAdd/ReadVariableOpdense1/BiasAdd/ReadVariableOp2<
dense1/MatMul/ReadVariableOpdense1/MatMul/ReadVariableOp:W S
/
_output_shapes
:         
 
_user_specified_nameinputs
Л	
╧
4__inference_batch_normalization_layer_call_fn_351656

inputs
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
identityИвStatefulPartitionedCallЦ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2*
Tin	
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *X
fSRQ
O__inference_batch_normalization_layer_call_and_return_conditional_losses_349636Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+                           `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+                           : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:i e
A
_output_shapes/
-:+                           
 
_user_specified_nameinputs
║
M
1__inference_upSamplingLayer2_layer_call_fn_351901

inputs
identity┌
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *J
_output_shapes8
6:4                                    * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *U
fPRN
L__inference_upSamplingLayer2_layer_call_and_return_conditional_losses_350083Г
IdentityIdentityPartitionedCall:output:0*
T0*J
_output_shapes8
6:4                                    "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*I
_input_shapes8
6:4                                    :r n
J
_output_shapes8
6:4                                    
 
_user_specified_nameinputs
р0
Ч	
__inference__traced_save_352079
file_prefix+
'savev2_conv1_kernel_read_readvariableop)
%savev2_conv1_bias_read_readvariableop8
4savev2_batch_normalization_gamma_read_readvariableop7
3savev2_batch_normalization_beta_read_readvariableop>
:savev2_batch_normalization_moving_mean_read_readvariableopB
>savev2_batch_normalization_moving_variance_read_readvariableop+
'savev2_conv2_kernel_read_readvariableop)
%savev2_conv2_bias_read_readvariableop,
(savev2_dense1_kernel_read_readvariableop*
&savev2_dense1_bias_read_readvariableop+
'savev2_dense_kernel_read_readvariableop)
%savev2_dense_bias_read_readvariableop2
.savev2_decodelayer1_kernel_read_readvariableop0
,savev2_decodelayer1_bias_read_readvariableop1
-savev2_outputlayer_kernel_read_readvariableop/
+savev2_outputlayer_bias_read_readvariableop+
'savev2_conv5_kernel_read_readvariableop)
%savev2_conv5_bias_read_readvariableop+
'savev2_conv6_kernel_read_readvariableop)
%savev2_conv6_bias_read_readvariableop+
'savev2_conv7_kernel_read_readvariableop)
%savev2_conv7_bias_read_readvariableop
savev2_const

identity_1ИвMergeV2Checkpointsw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/partБ
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : У
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: Ж
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*п
valueеBвB&variables/0/.ATTRIBUTES/VARIABLE_VALUEB&variables/1/.ATTRIBUTES/VARIABLE_VALUEB&variables/2/.ATTRIBUTES/VARIABLE_VALUEB&variables/3/.ATTRIBUTES/VARIABLE_VALUEB&variables/4/.ATTRIBUTES/VARIABLE_VALUEB&variables/5/.ATTRIBUTES/VARIABLE_VALUEB&variables/6/.ATTRIBUTES/VARIABLE_VALUEB&variables/7/.ATTRIBUTES/VARIABLE_VALUEB&variables/8/.ATTRIBUTES/VARIABLE_VALUEB&variables/9/.ATTRIBUTES/VARIABLE_VALUEB'variables/10/.ATTRIBUTES/VARIABLE_VALUEB'variables/11/.ATTRIBUTES/VARIABLE_VALUEB'variables/12/.ATTRIBUTES/VARIABLE_VALUEB'variables/13/.ATTRIBUTES/VARIABLE_VALUEB'variables/14/.ATTRIBUTES/VARIABLE_VALUEB'variables/15/.ATTRIBUTES/VARIABLE_VALUEB'variables/16/.ATTRIBUTES/VARIABLE_VALUEB'variables/17/.ATTRIBUTES/VARIABLE_VALUEB'variables/18/.ATTRIBUTES/VARIABLE_VALUEB'variables/19/.ATTRIBUTES/VARIABLE_VALUEB'variables/20/.ATTRIBUTES/VARIABLE_VALUEB'variables/21/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPHЫ
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*A
value8B6B B B B B B B B B B B B B B B B B B B B B B B Щ	
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0'savev2_conv1_kernel_read_readvariableop%savev2_conv1_bias_read_readvariableop4savev2_batch_normalization_gamma_read_readvariableop3savev2_batch_normalization_beta_read_readvariableop:savev2_batch_normalization_moving_mean_read_readvariableop>savev2_batch_normalization_moving_variance_read_readvariableop'savev2_conv2_kernel_read_readvariableop%savev2_conv2_bias_read_readvariableop(savev2_dense1_kernel_read_readvariableop&savev2_dense1_bias_read_readvariableop'savev2_dense_kernel_read_readvariableop%savev2_dense_bias_read_readvariableop.savev2_decodelayer1_kernel_read_readvariableop,savev2_decodelayer1_bias_read_readvariableop-savev2_outputlayer_kernel_read_readvariableop+savev2_outputlayer_bias_read_readvariableop'savev2_conv5_kernel_read_readvariableop%savev2_conv5_bias_read_readvariableop'savev2_conv6_kernel_read_readvariableop%savev2_conv6_bias_read_readvariableop'savev2_conv7_kernel_read_readvariableop%savev2_conv7_bias_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *%
dtypes
2Р
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:Л
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 f
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: Q

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: [
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*ь
_input_shapes┌
╫: ::::::: : :	а@:@:@::@:@:	@И:И:@:@:@:::: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:,(
&
_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
::,(
&
_output_shapes
: : 

_output_shapes
: :%	!

_output_shapes
:	а@: 


_output_shapes
:@:$ 

_output_shapes

:@: 

_output_shapes
::$ 

_output_shapes

:@: 

_output_shapes
:@:%!

_output_shapes
:	@И:!

_output_shapes	
:И:,(
&
_output_shapes
:@: 

_output_shapes
:@:,(
&
_output_shapes
:@: 

_output_shapes
::,(
&
_output_shapes
:: 

_output_shapes
::

_output_shapes
: 
∙
█
)__inference_ae_mnist_layer_call_fn_350997
x!
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:#
	unknown_5: 
	unknown_6: 
	unknown_7:	а@
	unknown_8:@
	unknown_9:@

unknown_10:

unknown_11:@

unknown_12:@

unknown_13:	@И

unknown_14:	И$

unknown_15:@

unknown_16:@$

unknown_17:@

unknown_18:$

unknown_19:

unknown_20:
identityИвStatefulPartitionedCall¤
StatefulPartitionedCallStatefulPartitionedCallxunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16
unknown_17
unknown_18
unknown_19
unknown_20*"
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *8
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8В *M
fHRF
D__inference_ae_mnist_layer_call_and_return_conditional_losses_350553Й
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+                           `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*Z
_input_shapesI
G:         : : : : : : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:R N
/
_output_shapes
:         

_user_specified_namex
Ф
╡
+__inference_sequential_layer_call_fn_349800
conv1_input!
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:#
	unknown_5: 
	unknown_6: 
	unknown_7:	а@
	unknown_8:@
	unknown_9:@

unknown_10:
identityИвStatefulPartitionedCallу
StatefulPartitionedCallStatefulPartitionedCallconv1_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *.
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8В *O
fJRH
F__inference_sequential_layer_call_and_return_conditional_losses_349773o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*F
_input_shapes5
3:         : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:\ X
/
_output_shapes
:         
%
_user_specified_nameconv1_input
ф
Ы
&__inference_conv1_layer_call_fn_351619

inputs!
unknown:
	unknown_0:
identityИвStatefulPartitionedCall▐
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 */
_output_shapes
:         *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *J
fERC
A__inference_conv1_layer_call_and_return_conditional_losses_349689w
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*/
_output_shapes
:         `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*2
_input_shapes!
:         : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:         
 
_user_specified_nameinputs
сн
ї
D__inference_ae_mnist_layer_call_and_return_conditional_losses_351270
xI
/sequential_conv1_conv2d_readvariableop_resource:>
0sequential_conv1_biasadd_readvariableop_resource:D
6sequential_batch_normalization_readvariableop_resource:F
8sequential_batch_normalization_readvariableop_1_resource:U
Gsequential_batch_normalization_fusedbatchnormv3_readvariableop_resource:W
Isequential_batch_normalization_fusedbatchnormv3_readvariableop_1_resource:I
/sequential_conv2_conv2d_readvariableop_resource: >
0sequential_conv2_biasadd_readvariableop_resource: C
0sequential_dense1_matmul_readvariableop_resource:	а@?
1sequential_dense1_biasadd_readvariableop_resource:@A
/sequential_dense_matmul_readvariableop_resource:@>
0sequential_dense_biasadd_readvariableop_resource:J
8sequential_1_decodelayer1_matmul_readvariableop_resource:@G
9sequential_1_decodelayer1_biasadd_readvariableop_resource:@J
7sequential_1_outputlayer_matmul_readvariableop_resource:	@ИG
8sequential_1_outputlayer_biasadd_readvariableop_resource:	ИK
1sequential_1_conv5_conv2d_readvariableop_resource:@@
2sequential_1_conv5_biasadd_readvariableop_resource:@K
1sequential_1_conv6_conv2d_readvariableop_resource:@@
2sequential_1_conv6_biasadd_readvariableop_resource:K
1sequential_1_conv7_conv2d_readvariableop_resource:@
2sequential_1_conv7_biasadd_readvariableop_resource:
identityИв-sequential/batch_normalization/AssignNewValueв/sequential/batch_normalization/AssignNewValue_1в>sequential/batch_normalization/FusedBatchNormV3/ReadVariableOpв@sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp_1в-sequential/batch_normalization/ReadVariableOpв/sequential/batch_normalization/ReadVariableOp_1в'sequential/conv1/BiasAdd/ReadVariableOpв&sequential/conv1/Conv2D/ReadVariableOpв'sequential/conv2/BiasAdd/ReadVariableOpв&sequential/conv2/Conv2D/ReadVariableOpв'sequential/dense/BiasAdd/ReadVariableOpв&sequential/dense/MatMul/ReadVariableOpв(sequential/dense1/BiasAdd/ReadVariableOpв'sequential/dense1/MatMul/ReadVariableOpв)sequential_1/conv5/BiasAdd/ReadVariableOpв(sequential_1/conv5/Conv2D/ReadVariableOpв)sequential_1/conv6/BiasAdd/ReadVariableOpв(sequential_1/conv6/Conv2D/ReadVariableOpв)sequential_1/conv7/BiasAdd/ReadVariableOpв(sequential_1/conv7/Conv2D/ReadVariableOpв0sequential_1/decodeLayer1/BiasAdd/ReadVariableOpв/sequential_1/decodeLayer1/MatMul/ReadVariableOpв/sequential_1/outputLayer/BiasAdd/ReadVariableOpв.sequential_1/outputLayer/MatMul/ReadVariableOpЮ
&sequential/conv1/Conv2D/ReadVariableOpReadVariableOp/sequential_conv1_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0╢
sequential/conv1/Conv2DConv2Dx.sequential/conv1/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:         *
paddingSAME*
strides
Ф
'sequential/conv1/BiasAdd/ReadVariableOpReadVariableOp0sequential_conv1_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0░
sequential/conv1/BiasAddBiasAdd sequential/conv1/Conv2D:output:0/sequential/conv1/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:         z
sequential/conv1/ReluRelu!sequential/conv1/BiasAdd:output:0*
T0*/
_output_shapes
:         а
-sequential/batch_normalization/ReadVariableOpReadVariableOp6sequential_batch_normalization_readvariableop_resource*
_output_shapes
:*
dtype0д
/sequential/batch_normalization/ReadVariableOp_1ReadVariableOp8sequential_batch_normalization_readvariableop_1_resource*
_output_shapes
:*
dtype0┬
>sequential/batch_normalization/FusedBatchNormV3/ReadVariableOpReadVariableOpGsequential_batch_normalization_fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0╞
@sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp_1ReadVariableOpIsequential_batch_normalization_fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0№
/sequential/batch_normalization/FusedBatchNormV3FusedBatchNormV3#sequential/conv1/Relu:activations:05sequential/batch_normalization/ReadVariableOp:value:07sequential/batch_normalization/ReadVariableOp_1:value:0Fsequential/batch_normalization/FusedBatchNormV3/ReadVariableOp:value:0Hsequential/batch_normalization/FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*K
_output_shapes9
7:         :::::*
epsilon%oГ:*
exponential_avg_factor%
╫#<┬
-sequential/batch_normalization/AssignNewValueAssignVariableOpGsequential_batch_normalization_fusedbatchnormv3_readvariableop_resource<sequential/batch_normalization/FusedBatchNormV3:batch_mean:0?^sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0*
validate_shape(╠
/sequential/batch_normalization/AssignNewValue_1AssignVariableOpIsequential_batch_normalization_fusedbatchnormv3_readvariableop_1_resource@sequential/batch_normalization/FusedBatchNormV3:batch_variance:0A^sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0*
validate_shape(┼
sequential/pool1/MaxPoolMaxPool3sequential/batch_normalization/FusedBatchNormV3:y:0*/
_output_shapes
:         *
ksize
*
paddingVALID*
strides
Ю
&sequential/conv2/Conv2D/ReadVariableOpReadVariableOp/sequential_conv2_conv2d_readvariableop_resource*&
_output_shapes
: *
dtype0╓
sequential/conv2/Conv2DConv2D!sequential/pool1/MaxPool:output:0.sequential/conv2/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:          *
paddingSAME*
strides
Ф
'sequential/conv2/BiasAdd/ReadVariableOpReadVariableOp0sequential_conv2_biasadd_readvariableop_resource*
_output_shapes
: *
dtype0░
sequential/conv2/BiasAddBiasAdd sequential/conv2/Conv2D:output:0/sequential/conv2/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:          z
sequential/conv2/ReluRelu!sequential/conv2/BiasAdd:output:0*
T0*/
_output_shapes
:          ╡
sequential/pool2/MaxPoolMaxPool#sequential/conv2/Relu:activations:0*/
_output_shapes
:          *
ksize
*
paddingVALID*
strides
k
sequential/predense1/ConstConst*
_output_shapes
:*
dtype0*
valueB"       в
sequential/predense1/ReshapeReshape!sequential/pool2/MaxPool:output:0#sequential/predense1/Const:output:0*
T0*(
_output_shapes
:         аЩ
'sequential/dense1/MatMul/ReadVariableOpReadVariableOp0sequential_dense1_matmul_readvariableop_resource*
_output_shapes
:	а@*
dtype0м
sequential/dense1/MatMulMatMul%sequential/predense1/Reshape:output:0/sequential/dense1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @Ц
(sequential/dense1/BiasAdd/ReadVariableOpReadVariableOp1sequential_dense1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0м
sequential/dense1/BiasAddBiasAdd"sequential/dense1/MatMul:product:00sequential/dense1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @t
sequential/dense1/ReluRelu"sequential/dense1/BiasAdd:output:0*
T0*'
_output_shapes
:         @g
"sequential/predense2/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  а?м
 sequential/predense2/dropout/MulMul$sequential/dense1/Relu:activations:0+sequential/predense2/dropout/Const:output:0*
T0*'
_output_shapes
:         @v
"sequential/predense2/dropout/ShapeShape$sequential/dense1/Relu:activations:0*
T0*
_output_shapes
:╢
9sequential/predense2/dropout/random_uniform/RandomUniformRandomUniform+sequential/predense2/dropout/Shape:output:0*
T0*'
_output_shapes
:         @*
dtype0p
+sequential/predense2/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *═╠L>х
)sequential/predense2/dropout/GreaterEqualGreaterEqualBsequential/predense2/dropout/random_uniform/RandomUniform:output:04sequential/predense2/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:         @Щ
!sequential/predense2/dropout/CastCast-sequential/predense2/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:         @и
"sequential/predense2/dropout/Mul_1Mul$sequential/predense2/dropout/Mul:z:0%sequential/predense2/dropout/Cast:y:0*
T0*'
_output_shapes
:         @Ц
&sequential/dense/MatMul/ReadVariableOpReadVariableOp/sequential_dense_matmul_readvariableop_resource*
_output_shapes

:@*
dtype0л
sequential/dense/MatMulMatMul&sequential/predense2/dropout/Mul_1:z:0.sequential/dense/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         Ф
'sequential/dense/BiasAdd/ReadVariableOpReadVariableOp0sequential_dense_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0й
sequential/dense/BiasAddBiasAdd!sequential/dense/MatMul:product:0/sequential/dense/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         r
sequential/dense/TanhTanh!sequential/dense/BiasAdd:output:0*
T0*'
_output_shapes
:         и
/sequential_1/decodeLayer1/MatMul/ReadVariableOpReadVariableOp8sequential_1_decodelayer1_matmul_readvariableop_resource*
_output_shapes

:@*
dtype0░
 sequential_1/decodeLayer1/MatMulMatMulsequential/dense/Tanh:y:07sequential_1/decodeLayer1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @ж
0sequential_1/decodeLayer1/BiasAdd/ReadVariableOpReadVariableOp9sequential_1_decodelayer1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0─
!sequential_1/decodeLayer1/BiasAddBiasAdd*sequential_1/decodeLayer1/MatMul:product:08sequential_1/decodeLayer1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @Д
sequential_1/decodeLayer1/ReluRelu*sequential_1/decodeLayer1/BiasAdd:output:0*
T0*'
_output_shapes
:         @g
"sequential_1/dropout/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  а?┤
 sequential_1/dropout/dropout/MulMul,sequential_1/decodeLayer1/Relu:activations:0+sequential_1/dropout/dropout/Const:output:0*
T0*'
_output_shapes
:         @~
"sequential_1/dropout/dropout/ShapeShape,sequential_1/decodeLayer1/Relu:activations:0*
T0*
_output_shapes
:╢
9sequential_1/dropout/dropout/random_uniform/RandomUniformRandomUniform+sequential_1/dropout/dropout/Shape:output:0*
T0*'
_output_shapes
:         @*
dtype0p
+sequential_1/dropout/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *═╠L>х
)sequential_1/dropout/dropout/GreaterEqualGreaterEqualBsequential_1/dropout/dropout/random_uniform/RandomUniform:output:04sequential_1/dropout/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:         @Щ
!sequential_1/dropout/dropout/CastCast-sequential_1/dropout/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:         @и
"sequential_1/dropout/dropout/Mul_1Mul$sequential_1/dropout/dropout/Mul:z:0%sequential_1/dropout/dropout/Cast:y:0*
T0*'
_output_shapes
:         @з
.sequential_1/outputLayer/MatMul/ReadVariableOpReadVariableOp7sequential_1_outputlayer_matmul_readvariableop_resource*
_output_shapes
:	@И*
dtype0╝
sequential_1/outputLayer/MatMulMatMul&sequential_1/dropout/dropout/Mul_1:z:06sequential_1/outputLayer/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:         Ие
/sequential_1/outputLayer/BiasAdd/ReadVariableOpReadVariableOp8sequential_1_outputlayer_biasadd_readvariableop_resource*
_output_shapes	
:И*
dtype0┬
 sequential_1/outputLayer/BiasAddBiasAdd)sequential_1/outputLayer/MatMul:product:07sequential_1/outputLayer/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ИГ
sequential_1/outputLayer/ReluRelu)sequential_1/outputLayer/BiasAdd:output:0*
T0*(
_output_shapes
:         Иz
sequential_1/reshapeLayer/ShapeShape+sequential_1/outputLayer/Relu:activations:0*
T0*
_output_shapes
:w
-sequential_1/reshapeLayer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: y
/sequential_1/reshapeLayer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:y
/sequential_1/reshapeLayer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:╙
'sequential_1/reshapeLayer/strided_sliceStridedSlice(sequential_1/reshapeLayer/Shape:output:06sequential_1/reshapeLayer/strided_slice/stack:output:08sequential_1/reshapeLayer/strided_slice/stack_1:output:08sequential_1/reshapeLayer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskk
)sequential_1/reshapeLayer/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :k
)sequential_1/reshapeLayer/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :k
)sequential_1/reshapeLayer/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :л
'sequential_1/reshapeLayer/Reshape/shapePack0sequential_1/reshapeLayer/strided_slice:output:02sequential_1/reshapeLayer/Reshape/shape/1:output:02sequential_1/reshapeLayer/Reshape/shape/2:output:02sequential_1/reshapeLayer/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:┼
!sequential_1/reshapeLayer/ReshapeReshape+sequential_1/outputLayer/Relu:activations:00sequential_1/reshapeLayer/Reshape/shape:output:0*
T0*/
_output_shapes
:         t
#sequential_1/upSamplingLayer2/ConstConst*
_output_shapes
:*
dtype0*
valueB"      v
%sequential_1/upSamplingLayer2/Const_1Const*
_output_shapes
:*
dtype0*
valueB"      л
!sequential_1/upSamplingLayer2/mulMul,sequential_1/upSamplingLayer2/Const:output:0.sequential_1/upSamplingLayer2/Const_1:output:0*
T0*
_output_shapes
:·
:sequential_1/upSamplingLayer2/resize/ResizeNearestNeighborResizeNearestNeighbor*sequential_1/reshapeLayer/Reshape:output:0%sequential_1/upSamplingLayer2/mul:z:0*
T0*/
_output_shapes
:         *
half_pixel_centers(в
(sequential_1/conv5/Conv2D/ReadVariableOpReadVariableOp1sequential_1_conv5_conv2d_readvariableop_resource*&
_output_shapes
:@*
dtype0Д
sequential_1/conv5/Conv2DConv2DKsequential_1/upSamplingLayer2/resize/ResizeNearestNeighbor:resized_images:00sequential_1/conv5/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:         @*
paddingSAME*
strides
Ш
)sequential_1/conv5/BiasAdd/ReadVariableOpReadVariableOp2sequential_1_conv5_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0╢
sequential_1/conv5/BiasAddBiasAdd"sequential_1/conv5/Conv2D:output:01sequential_1/conv5/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:         @~
sequential_1/conv5/ReluRelu#sequential_1/conv5/BiasAdd:output:0*
T0*/
_output_shapes
:         @t
#sequential_1/upSamplingLayer3/ConstConst*
_output_shapes
:*
dtype0*
valueB"      v
%sequential_1/upSamplingLayer3/Const_1Const*
_output_shapes
:*
dtype0*
valueB"      л
!sequential_1/upSamplingLayer3/mulMul,sequential_1/upSamplingLayer3/Const:output:0.sequential_1/upSamplingLayer3/Const_1:output:0*
T0*
_output_shapes
:ї
:sequential_1/upSamplingLayer3/resize/ResizeNearestNeighborResizeNearestNeighbor%sequential_1/conv5/Relu:activations:0%sequential_1/upSamplingLayer3/mul:z:0*
T0*/
_output_shapes
:         @*
half_pixel_centers(в
(sequential_1/conv6/Conv2D/ReadVariableOpReadVariableOp1sequential_1_conv6_conv2d_readvariableop_resource*&
_output_shapes
:@*
dtype0Д
sequential_1/conv6/Conv2DConv2DKsequential_1/upSamplingLayer3/resize/ResizeNearestNeighbor:resized_images:00sequential_1/conv6/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:         *
paddingSAME*
strides
Ш
)sequential_1/conv6/BiasAdd/ReadVariableOpReadVariableOp2sequential_1_conv6_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0╢
sequential_1/conv6/BiasAddBiasAdd"sequential_1/conv6/Conv2D:output:01sequential_1/conv6/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:         ~
sequential_1/conv6/ReluRelu#sequential_1/conv6/BiasAdd:output:0*
T0*/
_output_shapes
:         в
(sequential_1/conv7/Conv2D/ReadVariableOpReadVariableOp1sequential_1_conv7_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0▐
sequential_1/conv7/Conv2DConv2D%sequential_1/conv6/Relu:activations:00sequential_1/conv7/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:         *
paddingSAME*
strides
Ш
)sequential_1/conv7/BiasAdd/ReadVariableOpReadVariableOp2sequential_1_conv7_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0╢
sequential_1/conv7/BiasAddBiasAdd"sequential_1/conv7/Conv2D:output:01sequential_1/conv7/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:         ~
sequential_1/conv7/ReluRelu#sequential_1/conv7/BiasAdd:output:0*
T0*/
_output_shapes
:         |
IdentityIdentity%sequential_1/conv7/Relu:activations:0^NoOp*
T0*/
_output_shapes
:         й	
NoOpNoOp.^sequential/batch_normalization/AssignNewValue0^sequential/batch_normalization/AssignNewValue_1?^sequential/batch_normalization/FusedBatchNormV3/ReadVariableOpA^sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp_1.^sequential/batch_normalization/ReadVariableOp0^sequential/batch_normalization/ReadVariableOp_1(^sequential/conv1/BiasAdd/ReadVariableOp'^sequential/conv1/Conv2D/ReadVariableOp(^sequential/conv2/BiasAdd/ReadVariableOp'^sequential/conv2/Conv2D/ReadVariableOp(^sequential/dense/BiasAdd/ReadVariableOp'^sequential/dense/MatMul/ReadVariableOp)^sequential/dense1/BiasAdd/ReadVariableOp(^sequential/dense1/MatMul/ReadVariableOp*^sequential_1/conv5/BiasAdd/ReadVariableOp)^sequential_1/conv5/Conv2D/ReadVariableOp*^sequential_1/conv6/BiasAdd/ReadVariableOp)^sequential_1/conv6/Conv2D/ReadVariableOp*^sequential_1/conv7/BiasAdd/ReadVariableOp)^sequential_1/conv7/Conv2D/ReadVariableOp1^sequential_1/decodeLayer1/BiasAdd/ReadVariableOp0^sequential_1/decodeLayer1/MatMul/ReadVariableOp0^sequential_1/outputLayer/BiasAdd/ReadVariableOp/^sequential_1/outputLayer/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*Z
_input_shapesI
G:         : : : : : : : : : : : : : : : : : : : : : : 2^
-sequential/batch_normalization/AssignNewValue-sequential/batch_normalization/AssignNewValue2b
/sequential/batch_normalization/AssignNewValue_1/sequential/batch_normalization/AssignNewValue_12А
>sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp>sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp2Д
@sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp_1@sequential/batch_normalization/FusedBatchNormV3/ReadVariableOp_12^
-sequential/batch_normalization/ReadVariableOp-sequential/batch_normalization/ReadVariableOp2b
/sequential/batch_normalization/ReadVariableOp_1/sequential/batch_normalization/ReadVariableOp_12R
'sequential/conv1/BiasAdd/ReadVariableOp'sequential/conv1/BiasAdd/ReadVariableOp2P
&sequential/conv1/Conv2D/ReadVariableOp&sequential/conv1/Conv2D/ReadVariableOp2R
'sequential/conv2/BiasAdd/ReadVariableOp'sequential/conv2/BiasAdd/ReadVariableOp2P
&sequential/conv2/Conv2D/ReadVariableOp&sequential/conv2/Conv2D/ReadVariableOp2R
'sequential/dense/BiasAdd/ReadVariableOp'sequential/dense/BiasAdd/ReadVariableOp2P
&sequential/dense/MatMul/ReadVariableOp&sequential/dense/MatMul/ReadVariableOp2T
(sequential/dense1/BiasAdd/ReadVariableOp(sequential/dense1/BiasAdd/ReadVariableOp2R
'sequential/dense1/MatMul/ReadVariableOp'sequential/dense1/MatMul/ReadVariableOp2V
)sequential_1/conv5/BiasAdd/ReadVariableOp)sequential_1/conv5/BiasAdd/ReadVariableOp2T
(sequential_1/conv5/Conv2D/ReadVariableOp(sequential_1/conv5/Conv2D/ReadVariableOp2V
)sequential_1/conv6/BiasAdd/ReadVariableOp)sequential_1/conv6/BiasAdd/ReadVariableOp2T
(sequential_1/conv6/Conv2D/ReadVariableOp(sequential_1/conv6/Conv2D/ReadVariableOp2V
)sequential_1/conv7/BiasAdd/ReadVariableOp)sequential_1/conv7/BiasAdd/ReadVariableOp2T
(sequential_1/conv7/Conv2D/ReadVariableOp(sequential_1/conv7/Conv2D/ReadVariableOp2d
0sequential_1/decodeLayer1/BiasAdd/ReadVariableOp0sequential_1/decodeLayer1/BiasAdd/ReadVariableOp2b
/sequential_1/decodeLayer1/MatMul/ReadVariableOp/sequential_1/decodeLayer1/MatMul/ReadVariableOp2b
/sequential_1/outputLayer/BiasAdd/ReadVariableOp/sequential_1/outputLayer/BiasAdd/ReadVariableOp2`
.sequential_1/outputLayer/MatMul/ReadVariableOp.sequential_1/outputLayer/MatMul/ReadVariableOp:R N
/
_output_shapes
:         

_user_specified_namex
▒
F
*__inference_predense1_layer_call_fn_351737

inputs
identity▒
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:         а* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *N
fIRG
E__inference_predense1_layer_call_and_return_conditional_losses_349729a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:         а"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:          :W S
/
_output_shapes
:          
 
_user_specified_nameinputs
╒J
З
H__inference_sequential_1_layer_call_and_return_conditional_losses_351610

inputs=
+decodelayer1_matmul_readvariableop_resource:@:
,decodelayer1_biasadd_readvariableop_resource:@=
*outputlayer_matmul_readvariableop_resource:	@И:
+outputlayer_biasadd_readvariableop_resource:	И>
$conv5_conv2d_readvariableop_resource:@3
%conv5_biasadd_readvariableop_resource:@>
$conv6_conv2d_readvariableop_resource:@3
%conv6_biasadd_readvariableop_resource:>
$conv7_conv2d_readvariableop_resource:3
%conv7_biasadd_readvariableop_resource:
identityИвconv5/BiasAdd/ReadVariableOpвconv5/Conv2D/ReadVariableOpвconv6/BiasAdd/ReadVariableOpвconv6/Conv2D/ReadVariableOpвconv7/BiasAdd/ReadVariableOpвconv7/Conv2D/ReadVariableOpв#decodeLayer1/BiasAdd/ReadVariableOpв"decodeLayer1/MatMul/ReadVariableOpв"outputLayer/BiasAdd/ReadVariableOpв!outputLayer/MatMul/ReadVariableOpО
"decodeLayer1/MatMul/ReadVariableOpReadVariableOp+decodelayer1_matmul_readvariableop_resource*
_output_shapes

:@*
dtype0Г
decodeLayer1/MatMulMatMulinputs*decodeLayer1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @М
#decodeLayer1/BiasAdd/ReadVariableOpReadVariableOp,decodelayer1_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0Э
decodeLayer1/BiasAddBiasAdddecodeLayer1/MatMul:product:0+decodeLayer1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:         @j
decodeLayer1/ReluReludecodeLayer1/BiasAdd:output:0*
T0*'
_output_shapes
:         @Z
dropout/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *  а?Н
dropout/dropout/MulMuldecodeLayer1/Relu:activations:0dropout/dropout/Const:output:0*
T0*'
_output_shapes
:         @d
dropout/dropout/ShapeShapedecodeLayer1/Relu:activations:0*
T0*
_output_shapes
:Ь
,dropout/dropout/random_uniform/RandomUniformRandomUniformdropout/dropout/Shape:output:0*
T0*'
_output_shapes
:         @*
dtype0c
dropout/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *═╠L>╛
dropout/dropout/GreaterEqualGreaterEqual5dropout/dropout/random_uniform/RandomUniform:output:0'dropout/dropout/GreaterEqual/y:output:0*
T0*'
_output_shapes
:         @
dropout/dropout/CastCast dropout/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*'
_output_shapes
:         @Б
dropout/dropout/Mul_1Muldropout/dropout/Mul:z:0dropout/dropout/Cast:y:0*
T0*'
_output_shapes
:         @Н
!outputLayer/MatMul/ReadVariableOpReadVariableOp*outputlayer_matmul_readvariableop_resource*
_output_shapes
:	@И*
dtype0Х
outputLayer/MatMulMatMuldropout/dropout/Mul_1:z:0)outputLayer/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:         ИЛ
"outputLayer/BiasAdd/ReadVariableOpReadVariableOp+outputlayer_biasadd_readvariableop_resource*
_output_shapes	
:И*
dtype0Ы
outputLayer/BiasAddBiasAddoutputLayer/MatMul:product:0*outputLayer/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:         Иi
outputLayer/ReluReluoutputLayer/BiasAdd:output:0*
T0*(
_output_shapes
:         И`
reshapeLayer/ShapeShapeoutputLayer/Relu:activations:0*
T0*
_output_shapes
:j
 reshapeLayer/strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: l
"reshapeLayer/strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:l
"reshapeLayer/strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:Т
reshapeLayer/strided_sliceStridedSlicereshapeLayer/Shape:output:0)reshapeLayer/strided_slice/stack:output:0+reshapeLayer/strided_slice/stack_1:output:0+reshapeLayer/strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_mask^
reshapeLayer/Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :^
reshapeLayer/Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :^
reshapeLayer/Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :ъ
reshapeLayer/Reshape/shapePack#reshapeLayer/strided_slice:output:0%reshapeLayer/Reshape/shape/1:output:0%reshapeLayer/Reshape/shape/2:output:0%reshapeLayer/Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:Ю
reshapeLayer/ReshapeReshapeoutputLayer/Relu:activations:0#reshapeLayer/Reshape/shape:output:0*
T0*/
_output_shapes
:         g
upSamplingLayer2/ConstConst*
_output_shapes
:*
dtype0*
valueB"      i
upSamplingLayer2/Const_1Const*
_output_shapes
:*
dtype0*
valueB"      Д
upSamplingLayer2/mulMulupSamplingLayer2/Const:output:0!upSamplingLayer2/Const_1:output:0*
T0*
_output_shapes
:╙
-upSamplingLayer2/resize/ResizeNearestNeighborResizeNearestNeighborreshapeLayer/Reshape:output:0upSamplingLayer2/mul:z:0*
T0*/
_output_shapes
:         *
half_pixel_centers(И
conv5/Conv2D/ReadVariableOpReadVariableOp$conv5_conv2d_readvariableop_resource*&
_output_shapes
:@*
dtype0▌
conv5/Conv2DConv2D>upSamplingLayer2/resize/ResizeNearestNeighbor:resized_images:0#conv5/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:         @*
paddingSAME*
strides
~
conv5/BiasAdd/ReadVariableOpReadVariableOp%conv5_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype0П
conv5/BiasAddBiasAddconv5/Conv2D:output:0$conv5/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:         @d

conv5/ReluReluconv5/BiasAdd:output:0*
T0*/
_output_shapes
:         @g
upSamplingLayer3/ConstConst*
_output_shapes
:*
dtype0*
valueB"      i
upSamplingLayer3/Const_1Const*
_output_shapes
:*
dtype0*
valueB"      Д
upSamplingLayer3/mulMulupSamplingLayer3/Const:output:0!upSamplingLayer3/Const_1:output:0*
T0*
_output_shapes
:╬
-upSamplingLayer3/resize/ResizeNearestNeighborResizeNearestNeighborconv5/Relu:activations:0upSamplingLayer3/mul:z:0*
T0*/
_output_shapes
:         @*
half_pixel_centers(И
conv6/Conv2D/ReadVariableOpReadVariableOp$conv6_conv2d_readvariableop_resource*&
_output_shapes
:@*
dtype0▌
conv6/Conv2DConv2D>upSamplingLayer3/resize/ResizeNearestNeighbor:resized_images:0#conv6/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:         *
paddingSAME*
strides
~
conv6/BiasAdd/ReadVariableOpReadVariableOp%conv6_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0П
conv6/BiasAddBiasAddconv6/Conv2D:output:0$conv6/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:         d

conv6/ReluReluconv6/BiasAdd:output:0*
T0*/
_output_shapes
:         И
conv7/Conv2D/ReadVariableOpReadVariableOp$conv7_conv2d_readvariableop_resource*&
_output_shapes
:*
dtype0╖
conv7/Conv2DConv2Dconv6/Relu:activations:0#conv7/Conv2D/ReadVariableOp:value:0*
T0*/
_output_shapes
:         *
paddingSAME*
strides
~
conv7/BiasAdd/ReadVariableOpReadVariableOp%conv7_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0П
conv7/BiasAddBiasAddconv7/Conv2D:output:0$conv7/BiasAdd/ReadVariableOp:value:0*
T0*/
_output_shapes
:         d

conv7/ReluReluconv7/BiasAdd:output:0*
T0*/
_output_shapes
:         o
IdentityIdentityconv7/Relu:activations:0^NoOp*
T0*/
_output_shapes
:         С
NoOpNoOp^conv5/BiasAdd/ReadVariableOp^conv5/Conv2D/ReadVariableOp^conv6/BiasAdd/ReadVariableOp^conv6/Conv2D/ReadVariableOp^conv7/BiasAdd/ReadVariableOp^conv7/Conv2D/ReadVariableOp$^decodeLayer1/BiasAdd/ReadVariableOp#^decodeLayer1/MatMul/ReadVariableOp#^outputLayer/BiasAdd/ReadVariableOp"^outputLayer/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*:
_input_shapes)
':         : : : : : : : : : : 2<
conv5/BiasAdd/ReadVariableOpconv5/BiasAdd/ReadVariableOp2:
conv5/Conv2D/ReadVariableOpconv5/Conv2D/ReadVariableOp2<
conv6/BiasAdd/ReadVariableOpconv6/BiasAdd/ReadVariableOp2:
conv6/Conv2D/ReadVariableOpconv6/Conv2D/ReadVariableOp2<
conv7/BiasAdd/ReadVariableOpconv7/BiasAdd/ReadVariableOp2:
conv7/Conv2D/ReadVariableOpconv7/Conv2D/ReadVariableOp2J
#decodeLayer1/BiasAdd/ReadVariableOp#decodeLayer1/BiasAdd/ReadVariableOp2H
"decodeLayer1/MatMul/ReadVariableOp"decodeLayer1/MatMul/ReadVariableOp2H
"outputLayer/BiasAdd/ReadVariableOp"outputLayer/BiasAdd/ReadVariableOp2F
!outputLayer/MatMul/ReadVariableOp!outputLayer/MatMul/ReadVariableOp:O K
'
_output_shapes
:         
 
_user_specified_nameinputs
Д
╛
O__inference_batch_normalization_layer_call_and_return_conditional_losses_351692

inputs%
readvariableop_resource:'
readvariableop_1_resource:6
(fusedbatchnormv3_readvariableop_resource:8
*fusedbatchnormv3_readvariableop_1_resource:
identityИвAssignNewValueвAssignNewValue_1вFusedBatchNormV3/ReadVariableOpв!FusedBatchNormV3/ReadVariableOp_1вReadVariableOpвReadVariableOp_1b
ReadVariableOpReadVariableOpreadvariableop_resource*
_output_shapes
:*
dtype0f
ReadVariableOp_1ReadVariableOpreadvariableop_1_resource*
_output_shapes
:*
dtype0Д
FusedBatchNormV3/ReadVariableOpReadVariableOp(fusedbatchnormv3_readvariableop_resource*
_output_shapes
:*
dtype0И
!FusedBatchNormV3/ReadVariableOp_1ReadVariableOp*fusedbatchnormv3_readvariableop_1_resource*
_output_shapes
:*
dtype0╓
FusedBatchNormV3FusedBatchNormV3inputsReadVariableOp:value:0ReadVariableOp_1:value:0'FusedBatchNormV3/ReadVariableOp:value:0)FusedBatchNormV3/ReadVariableOp_1:value:0*
T0*
U0*]
_output_shapesK
I:+                           :::::*
epsilon%oГ:*
exponential_avg_factor%
╫#<╞
AssignNewValueAssignVariableOp(fusedbatchnormv3_readvariableop_resourceFusedBatchNormV3:batch_mean:0 ^FusedBatchNormV3/ReadVariableOp*
_output_shapes
 *
dtype0*
validate_shape(╨
AssignNewValue_1AssignVariableOp*fusedbatchnormv3_readvariableop_1_resource!FusedBatchNormV3:batch_variance:0"^FusedBatchNormV3/ReadVariableOp_1*
_output_shapes
 *
dtype0*
validate_shape(}
IdentityIdentityFusedBatchNormV3:y:0^NoOp*
T0*A
_output_shapes/
-:+                           ╘
NoOpNoOp^AssignNewValue^AssignNewValue_1 ^FusedBatchNormV3/ReadVariableOp"^FusedBatchNormV3/ReadVariableOp_1^ReadVariableOp^ReadVariableOp_1*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*H
_input_shapes7
5:+                           : : : : 2 
AssignNewValueAssignNewValue2$
AssignNewValue_1AssignNewValue_12B
FusedBatchNormV3/ReadVariableOpFusedBatchNormV3/ReadVariableOp2F
!FusedBatchNormV3/ReadVariableOp_1!FusedBatchNormV3/ReadVariableOp_12 
ReadVariableOpReadVariableOp2$
ReadVariableOp_1ReadVariableOp_1:i e
A
_output_shapes/
-:+                           
 
_user_specified_nameinputs
х
у
D__inference_ae_mnist_layer_call_and_return_conditional_losses_350701
x+
sequential_350654:
sequential_350656:
sequential_350658:
sequential_350660:
sequential_350662:
sequential_350664:+
sequential_350666: 
sequential_350668: $
sequential_350670:	а@
sequential_350672:@#
sequential_350674:@
sequential_350676:%
sequential_1_350679:@!
sequential_1_350681:@&
sequential_1_350683:	@И"
sequential_1_350685:	И-
sequential_1_350687:@!
sequential_1_350689:@-
sequential_1_350691:@!
sequential_1_350693:-
sequential_1_350695:!
sequential_1_350697:
identityИв"sequential/StatefulPartitionedCallв$sequential_1/StatefulPartitionedCall├
"sequential/StatefulPartitionedCallStatefulPartitionedCallxsequential_350654sequential_350656sequential_350658sequential_350660sequential_350662sequential_350664sequential_350666sequential_350668sequential_350670sequential_350672sequential_350674sequential_350676*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8В *O
fJRH
F__inference_sequential_layer_call_and_return_conditional_losses_349937ў
$sequential_1/StatefulPartitionedCallStatefulPartitionedCall+sequential/StatefulPartitionedCall:output:0sequential_1_350679sequential_1_350681sequential_1_350683sequential_1_350685sequential_1_350687sequential_1_350689sequential_1_350691sequential_1_350693sequential_1_350695sequential_1_350697*
Tin
2*
Tout
2*
_collective_manager_ids
 *A
_output_shapes/
-:+                           *,
_read_only_resource_inputs

	
*-
config_proto

CPU

GPU 2J 8В *Q
fLRJ
H__inference_sequential_1_layer_call_and_return_conditional_losses_350385Ц
IdentityIdentity-sequential_1/StatefulPartitionedCall:output:0^NoOp*
T0*A
_output_shapes/
-:+                           Т
NoOpNoOp#^sequential/StatefulPartitionedCall%^sequential_1/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*Z
_input_shapesI
G:         : : : : : : : : : : : : : : : : : : : : : : 2H
"sequential/StatefulPartitionedCall"sequential/StatefulPartitionedCall2L
$sequential_1/StatefulPartitionedCall$sequential_1/StatefulPartitionedCall:R N
/
_output_shapes
:         

_user_specified_namex
┴
Х
'__inference_dense1_layer_call_fn_351752

inputs
unknown:	а@
	unknown_0:@
identityИвStatefulPartitionedCall╫
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8В *K
fFRD
B__inference_dense1_layer_call_and_return_conditional_losses_349742o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         @`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:         а: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:         а
 
_user_specified_nameinputs
Ы
D
(__inference_dropout_layer_call_fn_351835

inputs
identityо
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_350134`
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:         @"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:         @:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
э
a
(__inference_dropout_layer_call_fn_351840

inputs
identityИвStatefulPartitionedCall╛
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         @* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8В *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_350312o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         @`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*&
_input_shapes
:         @22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:         @
 
_user_specified_nameinputs
э
·
A__inference_conv5_layer_call_and_return_conditional_losses_351933

inputs8
conv2d_readvariableop_resource:@-
biasadd_readvariableop_resource:@
identityИвBiasAdd/ReadVariableOpвConv2D/ReadVariableOp|
Conv2D/ReadVariableOpReadVariableOpconv2d_readvariableop_resource*&
_output_shapes
:@*
dtype0л
Conv2DConv2DinputsConv2D/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+                           @*
paddingSAME*
strides
r
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype0П
BiasAddBiasAddConv2D:output:0BiasAdd/ReadVariableOp:value:0*
T0*A
_output_shapes/
-:+                           @j
ReluReluBiasAdd:output:0*
T0*A
_output_shapes/
-:+                           @{
IdentityIdentityRelu:activations:0^NoOp*
T0*A
_output_shapes/
-:+                           @w
NoOpNoOp^BiasAdd/ReadVariableOp^Conv2D/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*D
_input_shapes3
1:+                           : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
Conv2D/ReadVariableOpConv2D/ReadVariableOp:i e
A
_output_shapes/
-:+                           
 
_user_specified_nameinputs
╤
d
H__inference_reshapeLayer_layer_call_and_return_conditional_losses_350167

inputs
identity;
ShapeShapeinputs*
T0*
_output_shapes
:]
strided_slice/stackConst*
_output_shapes
:*
dtype0*
valueB: _
strided_slice/stack_1Const*
_output_shapes
:*
dtype0*
valueB:_
strided_slice/stack_2Const*
_output_shapes
:*
dtype0*
valueB:╤
strided_sliceStridedSliceShape:output:0strided_slice/stack:output:0strided_slice/stack_1:output:0strided_slice/stack_2:output:0*
Index0*
T0*
_output_shapes
: *
shrink_axis_maskQ
Reshape/shape/1Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/2Const*
_output_shapes
: *
dtype0*
value	B :Q
Reshape/shape/3Const*
_output_shapes
: *
dtype0*
value	B :й
Reshape/shapePackstrided_slice:output:0Reshape/shape/1:output:0Reshape/shape/2:output:0Reshape/shape/3:output:0*
N*
T0*
_output_shapes
:l
ReshapeReshapeinputsReshape/shape:output:0*
T0*/
_output_shapes
:         `
IdentityIdentityReshape:output:0*
T0*/
_output_shapes
:         "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:         И:P L
(
_output_shapes
:         И
 
_user_specified_nameinputs
Е
░
+__inference_sequential_layer_call_fn_351299

inputs!
unknown:
	unknown_0:
	unknown_1:
	unknown_2:
	unknown_3:
	unknown_4:#
	unknown_5: 
	unknown_6: 
	unknown_7:	а@
	unknown_8:@
	unknown_9:@

unknown_10:
identityИвStatefulPartitionedCall▐
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:         *.
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8В *O
fJRH
F__inference_sequential_layer_call_and_return_conditional_losses_349773o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:         `
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*F
_input_shapes5
3:         : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:W S
/
_output_shapes
:         
 
_user_specified_nameinputs"╡	L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*╗
serving_defaultз
C
input_18
serving_default_input_1:0         D
output_18
StatefulPartitionedCall:0         tensorflow/serving/predict:ош
ь
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature
encoder
	decoder


signatures"
_tf_keras_model
╞
0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
 21"
trackable_list_wrapper
╢
0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
 19"
trackable_list_wrapper
 "
trackable_list_wrapper
╩
!non_trainable_variables

"layers
#metrics
$layer_regularization_losses
%layer_metrics
	variables
trainable_variables
regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
╘
&trace_0
'trace_1
(trace_2
)trace_32щ
)__inference_ae_mnist_layer_call_fn_350600
)__inference_ae_mnist_layer_call_fn_350997
)__inference_ae_mnist_layer_call_fn_351046
)__inference_ae_mnist_layer_call_fn_350797║
▒▓н
FullArgSpec
argsЪ
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargsЪ

jtraining%
kwonlydefaultsк

trainingp 
annotationsк *
 z&trace_0z'trace_1z(trace_2z)trace_3
└
*trace_0
+trace_1
,trace_2
-trace_32╒
D__inference_ae_mnist_layer_call_and_return_conditional_losses_351151
D__inference_ae_mnist_layer_call_and_return_conditional_losses_351270
D__inference_ae_mnist_layer_call_and_return_conditional_losses_350847
D__inference_ae_mnist_layer_call_and_return_conditional_losses_350897║
▒▓н
FullArgSpec
argsЪ
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargsЪ

jtraining%
kwonlydefaultsк

trainingp 
annotationsк *
 z*trace_0z+trace_1z,trace_2z-trace_3
╠B╔
!__inference__wrapped_model_349583input_1"Ш
С▓Н
FullArgSpec
argsЪ 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
б
.layer_with_weights-0
.layer-0
/layer_with_weights-1
/layer-1
0layer-2
1layer_with_weights-2
1layer-3
2layer-4
3layer-5
4layer_with_weights-3
4layer-6
5layer-7
6layer_with_weights-4
6layer-8
7	variables
8trainable_variables
9regularization_losses
:	keras_api
;__call__
*<&call_and_return_all_conditional_losses"
_tf_keras_sequential
б
=layer_with_weights-0
=layer-0
>layer-1
?layer_with_weights-1
?layer-2
@layer-3
Alayer-4
Blayer_with_weights-2
Blayer-5
Clayer-6
Dlayer_with_weights-3
Dlayer-7
Elayer_with_weights-4
Elayer-8
F	variables
Gtrainable_variables
Hregularization_losses
I	keras_api
J__call__
*K&call_and_return_all_conditional_losses"
_tf_keras_sequential
,
Lserving_default"
signature_map
&:$2conv1/kernel
:2
conv1/bias
':%2batch_normalization/gamma
&:$2batch_normalization/beta
/:- (2batch_normalization/moving_mean
3:1 (2#batch_normalization/moving_variance
&:$ 2conv2/kernel
: 2
conv2/bias
 :	а@2dense1/kernel
:@2dense1/bias
:@2dense/kernel
:2
dense/bias
%:#@2decodeLayer1/kernel
:@2decodeLayer1/bias
%:#	@И2outputLayer/kernel
:И2outputLayer/bias
&:$@2conv5/kernel
:@2
conv5/bias
&:$@2conv6/kernel
:2
conv6/bias
&:$2conv7/kernel
:2
conv7/bias
.
0
1"
trackable_list_wrapper
.
0
	1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ЎBє
)__inference_ae_mnist_layer_call_fn_350600input_1"║
▒▓н
FullArgSpec
argsЪ
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargsЪ

jtraining%
kwonlydefaultsк

trainingp 
annotationsк *
 
ЁBэ
)__inference_ae_mnist_layer_call_fn_350997x"║
▒▓н
FullArgSpec
argsЪ
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargsЪ

jtraining%
kwonlydefaultsк

trainingp 
annotationsк *
 
ЁBэ
)__inference_ae_mnist_layer_call_fn_351046x"║
▒▓н
FullArgSpec
argsЪ
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargsЪ

jtraining%
kwonlydefaultsк

trainingp 
annotationsк *
 
ЎBє
)__inference_ae_mnist_layer_call_fn_350797input_1"║
▒▓н
FullArgSpec
argsЪ
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargsЪ

jtraining%
kwonlydefaultsк

trainingp 
annotationsк *
 
ЛBИ
D__inference_ae_mnist_layer_call_and_return_conditional_losses_351151x"║
▒▓н
FullArgSpec
argsЪ
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargsЪ

jtraining%
kwonlydefaultsк

trainingp 
annotationsк *
 
ЛBИ
D__inference_ae_mnist_layer_call_and_return_conditional_losses_351270x"║
▒▓н
FullArgSpec
argsЪ
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargsЪ

jtraining%
kwonlydefaultsк

trainingp 
annotationsк *
 
СBО
D__inference_ae_mnist_layer_call_and_return_conditional_losses_350847input_1"║
▒▓н
FullArgSpec
argsЪ
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargsЪ

jtraining%
kwonlydefaultsк

trainingp 
annotationsк *
 
СBО
D__inference_ae_mnist_layer_call_and_return_conditional_losses_350897input_1"║
▒▓н
FullArgSpec
argsЪ
jself
jx
varargs
 
varkw
 
defaults
 

kwonlyargsЪ

jtraining%
kwonlydefaultsк

trainingp 
annotationsк *
 
▌
M	variables
Ntrainable_variables
Oregularization_losses
P	keras_api
Q__call__
*R&call_and_return_all_conditional_losses

kernel
bias
 S_jit_compiled_convolution_op"
_tf_keras_layer
ъ
T	variables
Utrainable_variables
Vregularization_losses
W	keras_api
X__call__
*Y&call_and_return_all_conditional_losses
Zaxis
	gamma
beta
moving_mean
moving_variance"
_tf_keras_layer
е
[	variables
\trainable_variables
]regularization_losses
^	keras_api
___call__
*`&call_and_return_all_conditional_losses"
_tf_keras_layer
▌
a	variables
btrainable_variables
cregularization_losses
d	keras_api
e__call__
*f&call_and_return_all_conditional_losses

kernel
bias
 g_jit_compiled_convolution_op"
_tf_keras_layer
е
h	variables
itrainable_variables
jregularization_losses
k	keras_api
l__call__
*m&call_and_return_all_conditional_losses"
_tf_keras_layer
е
n	variables
otrainable_variables
pregularization_losses
q	keras_api
r__call__
*s&call_and_return_all_conditional_losses"
_tf_keras_layer
╗
t	variables
utrainable_variables
vregularization_losses
w	keras_api
x__call__
*y&call_and_return_all_conditional_losses

kernel
bias"
_tf_keras_layer
╜
z	variables
{trainable_variables
|regularization_losses
}	keras_api
~__call__
*&call_and_return_all_conditional_losses
А_random_generator"
_tf_keras_layer
┴
Б	variables
Вtrainable_variables
Гregularization_losses
Д	keras_api
Е__call__
+Ж&call_and_return_all_conditional_losses

kernel
bias"
_tf_keras_layer
v
0
1
2
3
4
5
6
7
8
9
10
11"
trackable_list_wrapper
f
0
1
2
3
4
5
6
7
8
9"
trackable_list_wrapper
 "
trackable_list_wrapper
▓
Зnon_trainable_variables
Иlayers
Йmetrics
 Кlayer_regularization_losses
Лlayer_metrics
7	variables
8trainable_variables
9regularization_losses
;__call__
*<&call_and_return_all_conditional_losses
&<"call_and_return_conditional_losses"
_generic_user_object
щ
Мtrace_0
Нtrace_1
Оtrace_2
Пtrace_32Ў
+__inference_sequential_layer_call_fn_349800
+__inference_sequential_layer_call_fn_351299
+__inference_sequential_layer_call_fn_351328
+__inference_sequential_layer_call_fn_349993┐
╢▓▓
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zМtrace_0zНtrace_1zОtrace_2zПtrace_3
╒
Рtrace_0
Сtrace_1
Тtrace_2
Уtrace_32т
F__inference_sequential_layer_call_and_return_conditional_losses_351379
F__inference_sequential_layer_call_and_return_conditional_losses_351437
F__inference_sequential_layer_call_and_return_conditional_losses_350030
F__inference_sequential_layer_call_and_return_conditional_losses_350067┐
╢▓▓
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zРtrace_0zСtrace_1zТtrace_2zУtrace_3
┴
Ф	variables
Хtrainable_variables
Цregularization_losses
Ч	keras_api
Ш__call__
+Щ&call_and_return_all_conditional_losses

kernel
bias"
_tf_keras_layer
├
Ъ	variables
Ыtrainable_variables
Ьregularization_losses
Э	keras_api
Ю__call__
+Я&call_and_return_all_conditional_losses
а_random_generator"
_tf_keras_layer
┴
б	variables
вtrainable_variables
гregularization_losses
д	keras_api
е__call__
+ж&call_and_return_all_conditional_losses

kernel
bias"
_tf_keras_layer
л
з	variables
иtrainable_variables
йregularization_losses
к	keras_api
л__call__
+м&call_and_return_all_conditional_losses"
_tf_keras_layer
л
н	variables
оtrainable_variables
пregularization_losses
░	keras_api
▒__call__
+▓&call_and_return_all_conditional_losses"
_tf_keras_layer
ф
│	variables
┤trainable_variables
╡regularization_losses
╢	keras_api
╖__call__
+╕&call_and_return_all_conditional_losses

kernel
bias
!╣_jit_compiled_convolution_op"
_tf_keras_layer
л
║	variables
╗trainable_variables
╝regularization_losses
╜	keras_api
╛__call__
+┐&call_and_return_all_conditional_losses"
_tf_keras_layer
ф
└	variables
┴trainable_variables
┬regularization_losses
├	keras_api
─__call__
+┼&call_and_return_all_conditional_losses

kernel
bias
!╞_jit_compiled_convolution_op"
_tf_keras_layer
ф
╟	variables
╚trainable_variables
╔regularization_losses
╩	keras_api
╦__call__
+╠&call_and_return_all_conditional_losses

kernel
 bias
!═_jit_compiled_convolution_op"
_tf_keras_layer
f
0
1
2
3
4
5
6
7
8
 9"
trackable_list_wrapper
f
0
1
2
3
4
5
6
7
8
 9"
trackable_list_wrapper
 "
trackable_list_wrapper
▓
╬non_trainable_variables
╧layers
╨metrics
 ╤layer_regularization_losses
╥layer_metrics
F	variables
Gtrainable_variables
Hregularization_losses
J__call__
*K&call_and_return_all_conditional_losses
&K"call_and_return_conditional_losses"
_generic_user_object
ё
╙trace_0
╘trace_1
╒trace_2
╓trace_32■
-__inference_sequential_1_layer_call_fn_350246
-__inference_sequential_1_layer_call_fn_351462
-__inference_sequential_1_layer_call_fn_351487
-__inference_sequential_1_layer_call_fn_350433┐
╢▓▓
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 z╙trace_0z╘trace_1z╒trace_2z╓trace_3
▌
╫trace_0
╪trace_1
┘trace_2
┌trace_32ъ
H__inference_sequential_1_layer_call_and_return_conditional_losses_351545
H__inference_sequential_1_layer_call_and_return_conditional_losses_351610
H__inference_sequential_1_layer_call_and_return_conditional_losses_350466
H__inference_sequential_1_layer_call_and_return_conditional_losses_350499┐
╢▓▓
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 z╫trace_0z╪trace_1z┘trace_2z┌trace_3
╦B╚
$__inference_signature_wrapper_350948input_1"Ф
Н▓Й
FullArgSpec
argsЪ 
varargs
 
varkwjkwargs
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
▓
█non_trainable_variables
▄layers
▌metrics
 ▐layer_regularization_losses
▀layer_metrics
M	variables
Ntrainable_variables
Oregularization_losses
Q__call__
*R&call_and_return_all_conditional_losses
&R"call_and_return_conditional_losses"
_generic_user_object
ь
рtrace_02═
&__inference_conv1_layer_call_fn_351619в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zрtrace_0
З
сtrace_02ш
A__inference_conv1_layer_call_and_return_conditional_losses_351630в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zсtrace_0
┤2▒о
г▓Я
FullArgSpec'
argsЪ
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 0
<
0
1
2
3"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
▓
тnon_trainable_variables
уlayers
фmetrics
 хlayer_regularization_losses
цlayer_metrics
T	variables
Utrainable_variables
Vregularization_losses
X__call__
*Y&call_and_return_all_conditional_losses
&Y"call_and_return_conditional_losses"
_generic_user_object
▌
чtrace_0
шtrace_12в
4__inference_batch_normalization_layer_call_fn_351643
4__inference_batch_normalization_layer_call_fn_351656│
к▓ж
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zчtrace_0zшtrace_1
У
щtrace_0
ъtrace_12╪
O__inference_batch_normalization_layer_call_and_return_conditional_losses_351674
O__inference_batch_normalization_layer_call_and_return_conditional_losses_351692│
к▓ж
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zщtrace_0zъtrace_1
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
▓
ыnon_trainable_variables
ьlayers
эmetrics
 юlayer_regularization_losses
яlayer_metrics
[	variables
\trainable_variables
]regularization_losses
___call__
*`&call_and_return_all_conditional_losses
&`"call_and_return_conditional_losses"
_generic_user_object
ь
Ёtrace_02═
&__inference_pool1_layer_call_fn_351697в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zЁtrace_0
З
ёtrace_02ш
A__inference_pool1_layer_call_and_return_conditional_losses_351702в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zёtrace_0
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
▓
Єnon_trainable_variables
єlayers
Їmetrics
 їlayer_regularization_losses
Ўlayer_metrics
a	variables
btrainable_variables
cregularization_losses
e__call__
*f&call_and_return_all_conditional_losses
&f"call_and_return_conditional_losses"
_generic_user_object
ь
ўtrace_02═
&__inference_conv2_layer_call_fn_351711в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zўtrace_0
З
°trace_02ш
A__inference_conv2_layer_call_and_return_conditional_losses_351722в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 z°trace_0
┤2▒о
г▓Я
FullArgSpec'
argsЪ
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
▓
∙non_trainable_variables
·layers
√metrics
 №layer_regularization_losses
¤layer_metrics
h	variables
itrainable_variables
jregularization_losses
l__call__
*m&call_and_return_all_conditional_losses
&m"call_and_return_conditional_losses"
_generic_user_object
ь
■trace_02═
&__inference_pool2_layer_call_fn_351727в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 z■trace_0
З
 trace_02ш
A__inference_pool2_layer_call_and_return_conditional_losses_351732в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 z trace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
▓
Аnon_trainable_variables
Бlayers
Вmetrics
 Гlayer_regularization_losses
Дlayer_metrics
n	variables
otrainable_variables
pregularization_losses
r__call__
*s&call_and_return_all_conditional_losses
&s"call_and_return_conditional_losses"
_generic_user_object
Ё
Еtrace_02╤
*__inference_predense1_layer_call_fn_351737в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zЕtrace_0
Л
Жtrace_02ь
E__inference_predense1_layer_call_and_return_conditional_losses_351743в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zЖtrace_0
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
▓
Зnon_trainable_variables
Иlayers
Йmetrics
 Кlayer_regularization_losses
Лlayer_metrics
t	variables
utrainable_variables
vregularization_losses
x__call__
*y&call_and_return_all_conditional_losses
&y"call_and_return_conditional_losses"
_generic_user_object
э
Мtrace_02╬
'__inference_dense1_layer_call_fn_351752в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zМtrace_0
И
Нtrace_02щ
B__inference_dense1_layer_call_and_return_conditional_losses_351763в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zНtrace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
▓
Оnon_trainable_variables
Пlayers
Рmetrics
 Сlayer_regularization_losses
Тlayer_metrics
z	variables
{trainable_variables
|regularization_losses
~__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
╔
Уtrace_0
Фtrace_12О
*__inference_predense2_layer_call_fn_351768
*__inference_predense2_layer_call_fn_351773│
к▓ж
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zУtrace_0zФtrace_1
 
Хtrace_0
Цtrace_12─
E__inference_predense2_layer_call_and_return_conditional_losses_351778
E__inference_predense2_layer_call_and_return_conditional_losses_351790│
к▓ж
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zХtrace_0zЦtrace_1
"
_generic_user_object
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
╕
Чnon_trainable_variables
Шlayers
Щmetrics
 Ъlayer_regularization_losses
Ыlayer_metrics
Б	variables
Вtrainable_variables
Гregularization_losses
Е__call__
+Ж&call_and_return_all_conditional_losses
'Ж"call_and_return_conditional_losses"
_generic_user_object
ь
Ьtrace_02═
&__inference_dense_layer_call_fn_351799в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zЬtrace_0
З
Эtrace_02ш
A__inference_dense_layer_call_and_return_conditional_losses_351810в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zЭtrace_0
.
0
1"
trackable_list_wrapper
_
.0
/1
02
13
24
35
46
57
68"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
БB■
+__inference_sequential_layer_call_fn_349800conv1_input"┐
╢▓▓
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
№B∙
+__inference_sequential_layer_call_fn_351299inputs"┐
╢▓▓
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
№B∙
+__inference_sequential_layer_call_fn_351328inputs"┐
╢▓▓
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
БB■
+__inference_sequential_layer_call_fn_349993conv1_input"┐
╢▓▓
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
ЧBФ
F__inference_sequential_layer_call_and_return_conditional_losses_351379inputs"┐
╢▓▓
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
ЧBФ
F__inference_sequential_layer_call_and_return_conditional_losses_351437inputs"┐
╢▓▓
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
ЬBЩ
F__inference_sequential_layer_call_and_return_conditional_losses_350030conv1_input"┐
╢▓▓
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
ЬBЩ
F__inference_sequential_layer_call_and_return_conditional_losses_350067conv1_input"┐
╢▓▓
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
╕
Юnon_trainable_variables
Яlayers
аmetrics
 бlayer_regularization_losses
вlayer_metrics
Ф	variables
Хtrainable_variables
Цregularization_losses
Ш__call__
+Щ&call_and_return_all_conditional_losses
'Щ"call_and_return_conditional_losses"
_generic_user_object
є
гtrace_02╘
-__inference_decodeLayer1_layer_call_fn_351819в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zгtrace_0
О
дtrace_02я
H__inference_decodeLayer1_layer_call_and_return_conditional_losses_351830в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zдtrace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
╕
еnon_trainable_variables
жlayers
зmetrics
 иlayer_regularization_losses
йlayer_metrics
Ъ	variables
Ыtrainable_variables
Ьregularization_losses
Ю__call__
+Я&call_and_return_all_conditional_losses
'Я"call_and_return_conditional_losses"
_generic_user_object
┼
кtrace_0
лtrace_12К
(__inference_dropout_layer_call_fn_351835
(__inference_dropout_layer_call_fn_351840│
к▓ж
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zкtrace_0zлtrace_1
√
мtrace_0
нtrace_12└
C__inference_dropout_layer_call_and_return_conditional_losses_351845
C__inference_dropout_layer_call_and_return_conditional_losses_351857│
к▓ж
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 zмtrace_0zнtrace_1
"
_generic_user_object
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
╕
оnon_trainable_variables
пlayers
░metrics
 ▒layer_regularization_losses
▓layer_metrics
б	variables
вtrainable_variables
гregularization_losses
е__call__
+ж&call_and_return_all_conditional_losses
'ж"call_and_return_conditional_losses"
_generic_user_object
Є
│trace_02╙
,__inference_outputLayer_layer_call_fn_351866в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 z│trace_0
Н
┤trace_02ю
G__inference_outputLayer_layer_call_and_return_conditional_losses_351877в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 z┤trace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
╕
╡non_trainable_variables
╢layers
╖metrics
 ╕layer_regularization_losses
╣layer_metrics
з	variables
иtrainable_variables
йregularization_losses
л__call__
+м&call_and_return_all_conditional_losses
'м"call_and_return_conditional_losses"
_generic_user_object
є
║trace_02╘
-__inference_reshapeLayer_layer_call_fn_351882в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 z║trace_0
О
╗trace_02я
H__inference_reshapeLayer_layer_call_and_return_conditional_losses_351896в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 z╗trace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
╕
╝non_trainable_variables
╜layers
╛metrics
 ┐layer_regularization_losses
└layer_metrics
н	variables
оtrainable_variables
пregularization_losses
▒__call__
+▓&call_and_return_all_conditional_losses
'▓"call_and_return_conditional_losses"
_generic_user_object
ў
┴trace_02╪
1__inference_upSamplingLayer2_layer_call_fn_351901в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 z┴trace_0
Т
┬trace_02є
L__inference_upSamplingLayer2_layer_call_and_return_conditional_losses_351913в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 z┬trace_0
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
╕
├non_trainable_variables
─layers
┼metrics
 ╞layer_regularization_losses
╟layer_metrics
│	variables
┤trainable_variables
╡regularization_losses
╖__call__
+╕&call_and_return_all_conditional_losses
'╕"call_and_return_conditional_losses"
_generic_user_object
ь
╚trace_02═
&__inference_conv5_layer_call_fn_351922в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 z╚trace_0
З
╔trace_02ш
A__inference_conv5_layer_call_and_return_conditional_losses_351933в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 z╔trace_0
┤2▒о
г▓Я
FullArgSpec'
argsЪ
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
╕
╩non_trainable_variables
╦layers
╠metrics
 ═layer_regularization_losses
╬layer_metrics
║	variables
╗trainable_variables
╝regularization_losses
╛__call__
+┐&call_and_return_all_conditional_losses
'┐"call_and_return_conditional_losses"
_generic_user_object
ў
╧trace_02╪
1__inference_upSamplingLayer3_layer_call_fn_351938в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 z╧trace_0
Т
╨trace_02є
L__inference_upSamplingLayer3_layer_call_and_return_conditional_losses_351950в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 z╨trace_0
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
╕
╤non_trainable_variables
╥layers
╙metrics
 ╘layer_regularization_losses
╒layer_metrics
└	variables
┴trainable_variables
┬regularization_losses
─__call__
+┼&call_and_return_all_conditional_losses
'┼"call_and_return_conditional_losses"
_generic_user_object
ь
╓trace_02═
&__inference_conv6_layer_call_fn_351959в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 z╓trace_0
З
╫trace_02ш
A__inference_conv6_layer_call_and_return_conditional_losses_351970в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 z╫trace_0
┤2▒о
г▓Я
FullArgSpec'
argsЪ
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 0
.
0
 1"
trackable_list_wrapper
.
0
 1"
trackable_list_wrapper
 "
trackable_list_wrapper
╕
╪non_trainable_variables
┘layers
┌metrics
 █layer_regularization_losses
▄layer_metrics
╟	variables
╚trainable_variables
╔regularization_losses
╦__call__
+╠&call_and_return_all_conditional_losses
'╠"call_and_return_conditional_losses"
_generic_user_object
ь
▌trace_02═
&__inference_conv7_layer_call_fn_351979в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 z▌trace_0
З
▐trace_02ш
A__inference_conv7_layer_call_and_return_conditional_losses_351990в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 z▐trace_0
┤2▒о
г▓Я
FullArgSpec'
argsЪ
jself
jinputs
jkernel
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 0
 "
trackable_list_wrapper
_
=0
>1
?2
@3
A4
B5
C6
D7
E8"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
КBЗ
-__inference_sequential_1_layer_call_fn_350246decodeLayer1_input"┐
╢▓▓
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
■B√
-__inference_sequential_1_layer_call_fn_351462inputs"┐
╢▓▓
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
■B√
-__inference_sequential_1_layer_call_fn_351487inputs"┐
╢▓▓
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
КBЗ
-__inference_sequential_1_layer_call_fn_350433decodeLayer1_input"┐
╢▓▓
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
ЩBЦ
H__inference_sequential_1_layer_call_and_return_conditional_losses_351545inputs"┐
╢▓▓
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
ЩBЦ
H__inference_sequential_1_layer_call_and_return_conditional_losses_351610inputs"┐
╢▓▓
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
еBв
H__inference_sequential_1_layer_call_and_return_conditional_losses_350466decodeLayer1_input"┐
╢▓▓
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
еBв
H__inference_sequential_1_layer_call_and_return_conditional_losses_350499decodeLayer1_input"┐
╢▓▓
FullArgSpec1
args)Ъ&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaultsЪ
p 

 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
┌B╫
&__inference_conv1_layer_call_fn_351619inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
їBЄ
A__inference_conv1_layer_call_and_return_conditional_losses_351630inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
∙BЎ
4__inference_batch_normalization_layer_call_fn_351643inputs"│
к▓ж
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
∙BЎ
4__inference_batch_normalization_layer_call_fn_351656inputs"│
к▓ж
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
ФBС
O__inference_batch_normalization_layer_call_and_return_conditional_losses_351674inputs"│
к▓ж
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
ФBС
O__inference_batch_normalization_layer_call_and_return_conditional_losses_351692inputs"│
к▓ж
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
┌B╫
&__inference_pool1_layer_call_fn_351697inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
їBЄ
A__inference_pool1_layer_call_and_return_conditional_losses_351702inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
┌B╫
&__inference_conv2_layer_call_fn_351711inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
їBЄ
A__inference_conv2_layer_call_and_return_conditional_losses_351722inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
┌B╫
&__inference_pool2_layer_call_fn_351727inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
їBЄ
A__inference_pool2_layer_call_and_return_conditional_losses_351732inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
▐B█
*__inference_predense1_layer_call_fn_351737inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
∙BЎ
E__inference_predense1_layer_call_and_return_conditional_losses_351743inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
█B╪
'__inference_dense1_layer_call_fn_351752inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
ЎBє
B__inference_dense1_layer_call_and_return_conditional_losses_351763inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
яBь
*__inference_predense2_layer_call_fn_351768inputs"│
к▓ж
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
яBь
*__inference_predense2_layer_call_fn_351773inputs"│
к▓ж
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
КBЗ
E__inference_predense2_layer_call_and_return_conditional_losses_351778inputs"│
к▓ж
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
КBЗ
E__inference_predense2_layer_call_and_return_conditional_losses_351790inputs"│
к▓ж
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
┌B╫
&__inference_dense_layer_call_fn_351799inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
їBЄ
A__inference_dense_layer_call_and_return_conditional_losses_351810inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
сB▐
-__inference_decodeLayer1_layer_call_fn_351819inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
№B∙
H__inference_decodeLayer1_layer_call_and_return_conditional_losses_351830inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
эBъ
(__inference_dropout_layer_call_fn_351835inputs"│
к▓ж
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
эBъ
(__inference_dropout_layer_call_fn_351840inputs"│
к▓ж
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
ИBЕ
C__inference_dropout_layer_call_and_return_conditional_losses_351845inputs"│
к▓ж
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
ИBЕ
C__inference_dropout_layer_call_and_return_conditional_losses_351857inputs"│
к▓ж
FullArgSpec)
args!Ъ
jself
jinputs

jtraining
varargs
 
varkw
 
defaultsЪ
p 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
рB▌
,__inference_outputLayer_layer_call_fn_351866inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
√B°
G__inference_outputLayer_layer_call_and_return_conditional_losses_351877inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
сB▐
-__inference_reshapeLayer_layer_call_fn_351882inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
№B∙
H__inference_reshapeLayer_layer_call_and_return_conditional_losses_351896inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
хBт
1__inference_upSamplingLayer2_layer_call_fn_351901inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
АB¤
L__inference_upSamplingLayer2_layer_call_and_return_conditional_losses_351913inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
┌B╫
&__inference_conv5_layer_call_fn_351922inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
їBЄ
A__inference_conv5_layer_call_and_return_conditional_losses_351933inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
хBт
1__inference_upSamplingLayer3_layer_call_fn_351938inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
АB¤
L__inference_upSamplingLayer3_layer_call_and_return_conditional_losses_351950inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
┌B╫
&__inference_conv6_layer_call_fn_351959inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
їBЄ
A__inference_conv6_layer_call_and_return_conditional_losses_351970inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
┌B╫
&__inference_conv7_layer_call_fn_351979inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 
їBЄ
A__inference_conv7_layer_call_and_return_conditional_losses_351990inputs"в
Щ▓Х
FullArgSpec
argsЪ
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargsЪ 
kwonlydefaults
 
annotationsк *
 ╡
!__inference__wrapped_model_349583П 8в5
.в+
)К&
input_1         
к ";к8
6
output_1*К'
output_1         ь
D__inference_ae_mnist_layer_call_and_return_conditional_losses_350847г HвE
.в+
)К&
input_1         
к

trainingp "?в<
5К2
0+                           
Ъ ь
D__inference_ae_mnist_layer_call_and_return_conditional_losses_350897г HвE
.в+
)К&
input_1         
к

trainingp"?в<
5К2
0+                           
Ъ ╘
D__inference_ae_mnist_layer_call_and_return_conditional_losses_351151Л Bв?
(в%
#К 
x         
к

trainingp "-в*
#К 
0         
Ъ ╘
D__inference_ae_mnist_layer_call_and_return_conditional_losses_351270Л Bв?
(в%
#К 
x         
к

trainingp"-в*
#К 
0         
Ъ ─
)__inference_ae_mnist_layer_call_fn_350600Ц HвE
.в+
)К&
input_1         
к

trainingp "2К/+                           ─
)__inference_ae_mnist_layer_call_fn_350797Ц HвE
.в+
)К&
input_1         
к

trainingp"2К/+                           ╛
)__inference_ae_mnist_layer_call_fn_350997Р Bв?
(в%
#К 
x         
к

trainingp "2К/+                           ╛
)__inference_ae_mnist_layer_call_fn_351046Р Bв?
(в%
#К 
x         
к

trainingp"2К/+                           ъ
O__inference_batch_normalization_layer_call_and_return_conditional_losses_351674ЦMвJ
Cв@
:К7
inputs+                           
p 
к "?в<
5К2
0+                           
Ъ ъ
O__inference_batch_normalization_layer_call_and_return_conditional_losses_351692ЦMвJ
Cв@
:К7
inputs+                           
p
к "?в<
5К2
0+                           
Ъ ┬
4__inference_batch_normalization_layer_call_fn_351643ЙMвJ
Cв@
:К7
inputs+                           
p 
к "2К/+                           ┬
4__inference_batch_normalization_layer_call_fn_351656ЙMвJ
Cв@
:К7
inputs+                           
p
к "2К/+                           ▒
A__inference_conv1_layer_call_and_return_conditional_losses_351630l7в4
-в*
(К%
inputs         
к "-в*
#К 
0         
Ъ Й
&__inference_conv1_layer_call_fn_351619_7в4
-в*
(К%
inputs         
к " К         ▒
A__inference_conv2_layer_call_and_return_conditional_losses_351722l7в4
-в*
(К%
inputs         
к "-в*
#К 
0          
Ъ Й
&__inference_conv2_layer_call_fn_351711_7в4
-в*
(К%
inputs         
к " К          ╓
A__inference_conv5_layer_call_and_return_conditional_losses_351933РIвF
?в<
:К7
inputs+                           
к "?в<
5К2
0+                           @
Ъ о
&__inference_conv5_layer_call_fn_351922ГIвF
?в<
:К7
inputs+                           
к "2К/+                           @╓
A__inference_conv6_layer_call_and_return_conditional_losses_351970РIвF
?в<
:К7
inputs+                           @
к "?в<
5К2
0+                           
Ъ о
&__inference_conv6_layer_call_fn_351959ГIвF
?в<
:К7
inputs+                           @
к "2К/+                           ╓
A__inference_conv7_layer_call_and_return_conditional_losses_351990Р IвF
?в<
:К7
inputs+                           
к "?в<
5К2
0+                           
Ъ о
&__inference_conv7_layer_call_fn_351979Г IвF
?в<
:К7
inputs+                           
к "2К/+                           и
H__inference_decodeLayer1_layer_call_and_return_conditional_losses_351830\/в,
%в"
 К
inputs         
к "%в"
К
0         @
Ъ А
-__inference_decodeLayer1_layer_call_fn_351819O/в,
%в"
 К
inputs         
к "К         @г
B__inference_dense1_layer_call_and_return_conditional_losses_351763]0в-
&в#
!К
inputs         а
к "%в"
К
0         @
Ъ {
'__inference_dense1_layer_call_fn_351752P0в-
&в#
!К
inputs         а
к "К         @б
A__inference_dense_layer_call_and_return_conditional_losses_351810\/в,
%в"
 К
inputs         @
к "%в"
К
0         
Ъ y
&__inference_dense_layer_call_fn_351799O/в,
%в"
 К
inputs         @
к "К         г
C__inference_dropout_layer_call_and_return_conditional_losses_351845\3в0
)в&
 К
inputs         @
p 
к "%в"
К
0         @
Ъ г
C__inference_dropout_layer_call_and_return_conditional_losses_351857\3в0
)в&
 К
inputs         @
p
к "%в"
К
0         @
Ъ {
(__inference_dropout_layer_call_fn_351835O3в0
)в&
 К
inputs         @
p 
к "К         @{
(__inference_dropout_layer_call_fn_351840O3в0
)в&
 К
inputs         @
p
к "К         @и
G__inference_outputLayer_layer_call_and_return_conditional_losses_351877]/в,
%в"
 К
inputs         @
к "&в#
К
0         И
Ъ А
,__inference_outputLayer_layer_call_fn_351866P/в,
%в"
 К
inputs         @
к "К         Иф
A__inference_pool1_layer_call_and_return_conditional_losses_351702ЮRвO
HвE
CК@
inputs4                                    
к "HвE
>К;
04                                    
Ъ ╝
&__inference_pool1_layer_call_fn_351697СRвO
HвE
CК@
inputs4                                    
к ";К84                                    ф
A__inference_pool2_layer_call_and_return_conditional_losses_351732ЮRвO
HвE
CК@
inputs4                                    
к "HвE
>К;
04                                    
Ъ ╝
&__inference_pool2_layer_call_fn_351727СRвO
HвE
CК@
inputs4                                    
к ";К84                                    к
E__inference_predense1_layer_call_and_return_conditional_losses_351743a7в4
-в*
(К%
inputs          
к "&в#
К
0         а
Ъ В
*__inference_predense1_layer_call_fn_351737T7в4
-в*
(К%
inputs          
к "К         ае
E__inference_predense2_layer_call_and_return_conditional_losses_351778\3в0
)в&
 К
inputs         @
p 
к "%в"
К
0         @
Ъ е
E__inference_predense2_layer_call_and_return_conditional_losses_351790\3в0
)в&
 К
inputs         @
p
к "%в"
К
0         @
Ъ }
*__inference_predense2_layer_call_fn_351768O3в0
)в&
 К
inputs         @
p 
к "К         @}
*__inference_predense2_layer_call_fn_351773O3в0
)в&
 К
inputs         @
p
к "К         @н
H__inference_reshapeLayer_layer_call_and_return_conditional_losses_351896a0в-
&в#
!К
inputs         И
к "-в*
#К 
0         
Ъ Е
-__inference_reshapeLayer_layer_call_fn_351882T0в-
&в#
!К
inputs         И
к " К         ▀
H__inference_sequential_1_layer_call_and_return_conditional_losses_350466Т
 Cв@
9в6
,К)
decodeLayer1_input         
p 

 
к "?в<
5К2
0+                           
Ъ ▀
H__inference_sequential_1_layer_call_and_return_conditional_losses_350499Т
 Cв@
9в6
,К)
decodeLayer1_input         
p

 
к "?в<
5К2
0+                           
Ъ └
H__inference_sequential_1_layer_call_and_return_conditional_losses_351545t
 7в4
-в*
 К
inputs         
p 

 
к "-в*
#К 
0         
Ъ └
H__inference_sequential_1_layer_call_and_return_conditional_losses_351610t
 7в4
-в*
 К
inputs         
p

 
к "-в*
#К 
0         
Ъ ╖
-__inference_sequential_1_layer_call_fn_350246Е
 Cв@
9в6
,К)
decodeLayer1_input         
p 

 
к "2К/+                           ╖
-__inference_sequential_1_layer_call_fn_350433Е
 Cв@
9в6
,К)
decodeLayer1_input         
p

 
к "2К/+                           к
-__inference_sequential_1_layer_call_fn_351462y
 7в4
-в*
 К
inputs         
p 

 
к "2К/+                           к
-__inference_sequential_1_layer_call_fn_351487y
 7в4
-в*
 К
inputs         
p

 
к "2К/+                           ┼
F__inference_sequential_layer_call_and_return_conditional_losses_350030{DвA
:в7
-К*
conv1_input         
p 

 
к "%в"
К
0         
Ъ ┼
F__inference_sequential_layer_call_and_return_conditional_losses_350067{DвA
:в7
-К*
conv1_input         
p

 
к "%в"
К
0         
Ъ └
F__inference_sequential_layer_call_and_return_conditional_losses_351379v?в<
5в2
(К%
inputs         
p 

 
к "%в"
К
0         
Ъ └
F__inference_sequential_layer_call_and_return_conditional_losses_351437v?в<
5в2
(К%
inputs         
p

 
к "%в"
К
0         
Ъ Э
+__inference_sequential_layer_call_fn_349800nDвA
:в7
-К*
conv1_input         
p 

 
к "К         Э
+__inference_sequential_layer_call_fn_349993nDвA
:в7
-К*
conv1_input         
p

 
к "К         Ш
+__inference_sequential_layer_call_fn_351299i?в<
5в2
(К%
inputs         
p 

 
к "К         Ш
+__inference_sequential_layer_call_fn_351328i?в<
5в2
(К%
inputs         
p

 
к "К         ├
$__inference_signature_wrapper_350948Ъ Cв@
в 
9к6
4
input_1)К&
input_1         ";к8
6
output_1*К'
output_1         я
L__inference_upSamplingLayer2_layer_call_and_return_conditional_losses_351913ЮRвO
HвE
CК@
inputs4                                    
к "HвE
>К;
04                                    
Ъ ╟
1__inference_upSamplingLayer2_layer_call_fn_351901СRвO
HвE
CК@
inputs4                                    
к ";К84                                    я
L__inference_upSamplingLayer3_layer_call_and_return_conditional_losses_351950ЮRвO
HвE
CК@
inputs4                                    
к "HвE
>К;
04                                    
Ъ ╟
1__inference_upSamplingLayer3_layer_call_fn_351938СRвO
HвE
CК@
inputs4                                    
к ";К84                                    