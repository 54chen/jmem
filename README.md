jmem
====

Jmem is a java memory analysis tool.

jmem.sh
-------

Dependency:pmap,awk,gdb

Env:Linux

The example below will dump out all of the memory chunks between 65300K and 65537K.

<pre><code>

#./jmem.sh [pid] 65300 65537
.
.
.
.
See the big memory content:
#cat /tmp/[pid]*.dump

</code></pre>

Take care: 

The file dumpped will be very big.Make sure the /tmp have enough space.

pmap2stack.sh
--------------

Dependency:pmap,awk,gdb,pstack,jstack

Env:Linux

The example below will dump out all of the memory chunks between 65300K and 65537K.And the result will show the address in jstack or pstack file.

<pre><code>

#./pmap2stack.sh [pid] 65300 65537
.
.
.

</code></pre>

Enjoy it!
