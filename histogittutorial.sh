    1  git --version
    2  history
    3  git config user.name 
    4  gitgit config user.email
    5  git config  user.email 
    6  git config --global user.name 
    7  git config --global user.email 
    8  git status
    9  rm Untitled 
   10  ls
   11  vim ~/.gitconfig 
   12  git config --global ui
   13  git config --global color.ui 
   14  ls
   15  cd
   16  ls
   17  cd 123376/
   18  ls
   19  git init 
   20  ls
   21  git config --global user.name
   22  git config --global user.email
   23  git config user.email
   24  vi
   25  clear
   26  #which files are tracked
   27  git status 
   28  git add helloworld.js test.txt
   29  git status 
   30  vim test.txt 
   31  git status 
   32  vim todo
   33  git status 
   34  git add todo
   35  git status
   36  git add .
   37  git status 
   38  vi todo
   39  git status 
   40  git add .
   41  git status 
   42  vim todo
   43  git status
   44  cat "hekk" > newf
   45  echo "ehllhl" | cat > newf
   46  git status
   47  git add .
   48  rm .
   49  ls
   50  rm *
   51  git status
   52  git checkout -- ...
   53  git checkout -- 
   54  ls
   55  git checkout -- ..
   56  git checkout -- .
   57  ls
   58  git status
   59  vim todo
   60  ls
   61  #use git -- . to ignore all changes to directory after commit 
   62  git commit 
   63  git status
   64  vim todo
   65  git status
   66  vimlicence
   67  vim licence
   68  git status
   69  git commit -a
   70  git status
   71  git add
   72  git add .
   73  git commit -am "add a licence"
   74  #Lesson 06 ignore
   75  touch .DS_Strore
   76  mkdir temp
   77  vim todo
   78  git status
   79  git commit -am "only commit some"git status
   80  git status
   81  git commit -am "only commit wanteded "
   82  git status
   83  ls
   84  touch temp/txt
   85  git status
   86  vim .gitignore
   87  ls
   88  ls -a
   89  git status
   90  vim .gitignore 
   91  git status
   92  git add .
   93  git add .
   94  git add .
   95  git status
   96  git commit -am "adde ignore file"
   97  touch temp/master.txt
   98  git status
   99  ls
  100  vim .gitignore 
  101  mv temp test
  102  git status
  103  git add .
  104  git status 
  105  #to unstage: git reset HEAD test/txt
  106   git reset HEAD test/txt
  107  git status
  108  rm test/txt 
  109  git status
  110  git dif
  111  git diff
  112  git diff todo
  113  ls
  114  git diff newf
  115  git diff todo
  116  vim todo
  117  git diff todo
  118  git add .
  119  git diff todo 
  120  git diff --staged todo
  121  git diff HEAD
  122  git diff 
  123  git diff master
  124  git log
  125  git log --stat
  126  git log --oneline
  127  git diff cb439ff todo 
  128  git log --grahp
  129  git log --graph
  130  git log --oneline --graph
  131  git log --pretty="%h, %cn, %cr"
  132  #log format string placeholders are on the git-scm site
  133  gitk
  134  #that's how we can look at the history
  135  #two ways
  136  alias gl='git log --oneline --all --graph --decorate'
  137  gl
  138  #creating a branch
  139  git status
  140  git commit -am a new master.txt to test/ and modified todo'
  141  git commit -am 'add a new master.txt to test/ and modified todo'
  142  #now back to branch lesson
  143  git branch
  144  git branch experimental-1
  145  git branch
  146  git checkout experimental-1 
  147  git status
  148  ls
  149  vim todo
  150  git status
  151  #on branch experimental-1 modified
  152  git commit -am 'add a line on this branch'
  153  git status
  154  git checkout master
  155  vim todo #to see if something has changed
  156  #there's no changed in todo on master branch
  157  ls
  158  touch ouch readme
  159  vim readme
  160  git status
  161  rm ouch
  162  ls
  163  git status
  164  git add .
  165  vim readme 
  166  ls
  167  vim readme 
  168  git status
  169  git commit -am 'added a line'
  170  ls
  171  vim newf
  172  git status
  173  git checkout experimental-1
  174  git commit -am 'added a line to newf when on master branch but modify is available on this experimental-1 branch'
  175  git statas
  176  git status
  177  #so even if we make changes on one branch git will only see the branch on which the changed has been commited
  178  git checkout master
  179  git status
  180  vim newf
  181  #file not  modified on master !
  182  #create a new branch when it is not there
  183  git checkout -b bug-fix-1
  184  vim fix.txt
  185  git status
  186  git commit -am 'we fixed the bug'
  187  git status
  188  git add .
  189  git commit  -am 'we fixed the bug'
  190  git status
  191  open . &
  192  git checkout master
  193  ls
  194  git log --oneline
  195  git log --oneline --graph
  196  git log --oneline --all --graph
  197  #that let us see all branches
  198  git log --oneline --all --graph --decorate
  199  git checkout bug-fix-1 
  200  git log --oneline --all --graph --decorate
  201  git checkout  master
  202  ls
  203  vim readme 
  204  clear
  205  git status
  206  git commit -am 'updated readme'
  207  git log --oneline --all --graph --decorate
  208  git checkout bug-fix-1 
  209  git log --oneline --all --graph --decorate
  210  #two ways
  211  gl
  212  git checkout 
  213  git branch
  214  git checkout master 
  215  git branch
  216  git merge bug-fix-1 
  217  gl
  218  ls
  219  #now we have fix.txt file on master branch
  220  git diff  a3c0508 c9aee28
  221  l
  222  gl
  223  #delete the branch will not delete the contents on that branch
  224  git branch -d bug-fix-1 
  225  gl
  226  git --oneline --graph --all  --decorate
  227  git log   --oneline --graph --all  --decorate
  228  #referrence to the  btranch deleted 
  229  # how if there is some conflict
  230  # rebase. here we record down the graph before rebase in to a file
  231  git log   --oneline --graph --all  --decorate > ../record.rebase
  232  cat ../record.rebase 
  233  #now rebase all later changes on experimental-1 branch
  234  git branch
  235  git rebase experimental-1 
  236  '=========================' |cat >> ../record.rebase 
  237  echo '=========================' |cat >> ../record.rebase 
  238  cat ../record.rebase 
  239  git log   --oneline --graph --all  --decorate >> ../record.rebase
  240  cat ../record.rebase 
  241  #now is rebased
  242  # delete the experimental branch
  243  git branch -d experimental-1 
  244  git log   --oneline --graph --all  --decorate >> ../record.rebase
  245  cat ../record.rebase 
  246  vim ../record.rebase 
  247  #13 github
  248  ls
  249  ls ..
  250  history >> ../histogittutorial.history
  251  #create repositroy on git hub
  252  # ssh settings
  253  # ssh key
  254  cd ~/.ssh
  255  ls
  256  ssh-keygen -t rsa -C 'emptist@googlegroups.com'
  257  git remote
  258  cd 
  259  ls
  260  cd 123376/
  261  git ote
  262  git remote
  263  git push -u origin master 
  264  ls -a 
  265  vim .gitignore 
  266  ls ../
  267  mv ../record.rebase .
  268  mv ../histogittutorial.history .
  269  vim .gitignore 
  270  git status 
  271  vim .gitignore 
  272  git status 
  273  vim .gitignore 
  274  vim .gitignore 
  275  git status 
  276  git commit -am "add history and rebase example files here aes here and ignored them
'
"
  277  git status 
  278  git push -u origin master 
  279  git status
  280  #14 github tour
  281  # unwatch fork
  282  #service hooks
  283  #15 remote push pull 
  284  history
  285  y
  286  history
  287  history > histogittutorial.history 
