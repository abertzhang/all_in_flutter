### 仓库创建初始化

```
svnadmin create	//创建一个新的仓库
git init 	//在git创建新库
```

### *Checkout*仓库

```
使用SVN checkout(co)来checkout本地或远程仓库的代码

git clone//先clone到本地,同时还会checkout当前active的分支


```

### 将文件纳入版本管理

```
SVN add
git add //git-update-index –-add

```

### 检查当前状态

```
SVN Status SVN Status
git status //命令显示当前index的状态和working tree的状态
```

###  提交文件

```
Git commit //先用git add . 添加所有
```

### 删除文件

```
Svn rm//删除一个目录
git rm// 删除文件
```

### 查看log

```
svn log//命令基本上就是用来查看版本提交时的所填写的log信息

git log//可以输出特定版本的具体变更内容等等信息
```

### 版本回溯

```
//在SVN中，不提供任何从仓库中删除对象的机制，任何的修改都会导致版本的递增，所以，如果想丢弃一个修改，你需要做的事是反向diff你的修改，再提交一个新的版本。//
git-revert//提交一个新的版本将需要revert的版本的内容再反向修改回去，版本会递增，不影响之前提交的内容

```

### 放弃当前修改

```
SVN revert//对目录或文件操作都可以将当前工作树上特定路径的修改恢复到服务器上的版本，放弃当前的修改
git checkout//对特定文件使用不带其它参数,命令可以将文件恢复到index中的状态
//git checkout有个问题，不知道是否是故意这样设计的，就是即使用git rm删除的内容，如果没有提交，git checkout以后也会恢复，包括它在index中的状态。//
git merge//能够自动记住以前merge过的位置和状态，这个比较容易理解，因为通过每个分支的head commit可以跟踪它的对象索引关系
```

### 代码合并

```
SVN的Merge操作不会记住它的merge历史

git merge//能够自动记住以前merge过的位置和状态
```

### 获取单纯的代码

```
svn export//如果不需要任何历史信息，只想要某个版本纯粹的代码

于git的本地仓库信息完全维护在project根目录的.git目录下，（不像svn一样，每个子目录下都有单独的.svn目录）。所以，只要clone，checkout然后删除.git目录就可以了。

```

### 远程提交

```
//对于SVN来说，由于是中心式的仓库管理形式，所以并不存在特殊的远程提交的概念，所有的commit操作都可以认为是对远程仓库的更新动作//

git push //git中，因为有本地仓库和remote仓库之分，所以也就区别于commit 操作，存在额外的push命令

```

### 远程更新

```
svn update//因为只有一个中心仓库，所以所谓的远程更新

对于git来说，别人的改动是存在于远程仓库上的，所以git checkout命令尽管在某些功能上和svn中的update类似（例如取仓库特定版本的内容），但是在远程更新这一点上，还是不同的，不属于git checkout的功能涵盖范围

Git使用git fetch和git pull来完成远程更新任务，fetch操作只是将远程数据库的object拷贝到本地，然后更新remotes head的refs，git pull 的操作则是在git fetch的基础上对当前分支外加merge操作

Git使用git fetch和git pull来完成远程更新任务，fetch操作只是将远程数据库的object拷贝到本地，然后更新remotes head的refs，git pull 的操作则是在git fetch的基础上对当前分支外加merge操作
```

### 多分枝协同工作

```
SVN中，我很喜欢的一个功能就是switch，使用Switch可以在同一个工作树上，对不同的模块checkout不同分支上的代码。 举个例子： 我从主干上checkout了整个内核树，然后使用switch命令将其中一个或几个驱动的目录或文件切换到我的个人分支或其它人的分支上去，这样，我可以使用一个update命令同时从几个不同的来源更新特定的文件，而我在工作树上对switch过的文件做的修改会自动提交到我的个人分支上，而不是主干的路径上。这样我的修改不会影响主干的内容，而同时又能随时更新主干上的最新内容。不仅方便工作，也有利于权限控制。一切都是自动的，方便！
 

在Git中，尽管也可以使用checkout命令checkout 特定分支的特定文件到当前分支的工作树上, 但是，这只是简单的更新当前工作树的文件内容而已，这些文件并不会被关联到他的来源上去，也就是说你做的任何修改，还是针对当前分支的。
 

对于多分枝协同工作，我所见到的常见的工作模式是fetch远程更新，然后merge到当前分支。这对于维护会冲突的不同版本和快速切换局部分支显然还是有所不足的。
 

这种情况或许和git的分布式仓库结构和整体设计思路有关，或许这样有利于保持所有开发者之间的代码的同步，但是总觉得这是个遗憾，这方面没有深入的再去研究，或许通过borrow object的方式可以部分实现类似SVN的switch的功能？（也或许要实现多分枝协同工作，在Git中还有其它不同思路的更巧妙的办法？） 哪位高手知道解决办法的还请不吝赐教！
 

git submodules 看起来是为了解决类似多个有依赖关系的模块的协同工作问题。不过用起来似乎有不少限制和麻烦。
```

### 权限控制

```
对于git协同工作时的权限控制，还没有仔细研究，不知道能否像SVN那样，通过Apache的用户账号形式，对每一个用户精确控制到文件级别的读写权限。 目前初步查找了一下，看来似乎没有这样的功能，不知道设计的初衷是什么，对于小组开发来说或许会比较麻烦？
 

这个与开源精神应该没有太直接的关系才对，因为很多时候，其实权限控制的目的倒不是纯粹为了限制对代码的Access，主要还是为了减少代码冲突，减少误操作等情况的发生
```

### 恢复丢失的版本

```
丢失版本最常见的问题就是 比如使用了 git reset –hard HEAD^之类的操作，结果发现丢弃的版本还想恢复回来，但是已经没有任何分支能够reference到这个commit了。幸运的是，git 对各个分支的head还有一份log记录叫做reflog，你可以在.git/logs/refs/head/ 目录下看到他们。 通过 git reflog 可以显示变更历史。使用类似 master@{1} master@{“2 days ago”}之类的格式，就能索引到你想要的commit。例如对应于git reset –hard HEAD^ 使用 git reset --hard HEAD@{1}即可恢复到reset之前的commit上。
```

### 修改最近一次*commit*的内容

```
如果只是想对最近一次的提交做一些变更，但是不想在commit tree上递增版本的话，可以使用git commit –amend来实现，在现有的基础上做任何你想做的变更，然后用带–amend参数的commit命令提交即可。基本上，这个操作近似等同于于以下操作：

$ git reset --soft HEAD^

$ ... do something else to come up with the right tree ...

$ git commit -c ORIG_HEAD

和git reset之类的操作类似，对于已经push的内容，最好是不要做这些回滚的操作，因为实际上，原先commit的head还是存在的，新的head和以前的head没有继承关系，在协同工作的时候容易产生一些问题（我猜想主要是merge相关的操作吧，因为merge是根据对象的继承关系来自动判断需要merge的内容的，对于已经merge过的分支被回滚以后，可能无法自动区别识别出这部分内容应该如何处理）
```

