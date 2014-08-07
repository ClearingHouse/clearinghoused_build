Setting up viacoind
====================

.. warning::

    This section sets up ``clearinghoused`` to run on mainnet, which means that when using it, **you will be working with real XCP**.
	  If you would like to run on testnet instead, please see the section entitled **Running clearinghoused on testnet** in
	  :doc:`Additional Topics <AdditionalTopics>`.

``clearinghoused`` communicates with the Viacoin reference client (``viacoind``). Normally, you'll run ``viacoind``
on the same computer as your instance of ``clearinghoused`` runs on. However, you can also use a ``viacoind`` instance
sitting on a different server entirely.

This step is necessary whether you're :doc:`building clearinghoused from source <BuildingFromSource>` or
using the :doc:`installer package <UsingTheInstaller>`.


On Windows
-----------

If you haven't already, go to `the viacoind download page <http://viacoin.org/en/download>`__
and grab the installer for Windows. Install it with the default options.

Once installed, type Windows Key-R and enter ``cmd.exe`` to open a Windows command prompt. Type the following::

    cd %APPDATA%\Viacoin
    notepad viacoin.conf  

Say Yes to when Notepad asks if you want to create a new file, then paste in the text below::

    rpcuser=rpc
    rpcpassword=rpcpw1234
    server=1
    daemon=1
    txindex=1

**NOTE**:

- If you want ``viacoind`` to be on testnet, not mainnet, see the section entitled **Running clearinghoused on testnet** in :doc:`Additional Topics <AdditionalTopics>`.
- You should change the RPC password above to something more secure.
    
Once done, press CTRL-S to save, and close Notepad.  The config file will be saved here::

    ``%AppData%\Roaming\Counterparty\clearinghoused\clearinghoused.conf``

New Blockchain Download
^^^^^^^^^^^^^^^^^^^^^^^^

Next, if you haven't ever run Viacoin on this machine (i.e. no blockchain has been downloaded),
you can just launch ``viacoind`` or ``viacoin-qt`` and wait for the blockchain to finish downloading.

Already have Blockchain
^^^^^^^^^^^^^^^^^^^^^^^^

If you have already downloaded the blockchain on your computer (e.g. you're already using the Viacoin client) **and** 
you did not have the configuration parameter ``txindex=1`` enabled, you will probably need to open up a command prompt
window, change to the Viacoin program directory (e.g. ``C:\Program Files (x86)\Viacoin\``) and run::

    viacoin-qt.exe --reindex
    
or::

    daemon\viacoind.exe --reindex
    
This will start up viacoin to do a one time reindexing of the blockchain on disk. The reason this is is because we 
added the ``txindex=1`` configuration parameter above to the viacoin config file, which means that it will need to
run through the blockchain again to generate the necessary indexes, which may take a few hours. After doing
this once, you shouldn't have to do it again.   

Next steps
^^^^^^^^^^^

Once this is done, you have two options:

- Close Viacoin-QT and run ``viacoind.exe`` directly. You can run it on startup by adding to your
  Startup program group in Windows, or using something like `NSSM <http://nssm.cc/usage>`__.
- You can simply restart Viacoin-QT (for the configuration changes to take effect) and use that. This is
  fine for development/test setups, but not normally suitable for production systems. (You can have
  Viacoin-QT start up automatically by clicking on Settings, then Options and checking the
  box titled "Start Viacoin on system startup".)


On Ubuntu Linux
----------------

If not already installed (or running on a different machine), do the following
to install it (on Ubuntu, other distros will have similar instructions)::

    sudo apt-get install software-properties-common python-software-properties
    sudo add-apt-repository ppa:viacoin/viacoin
    sudo apt-get update
    sudo apt-get install viacoind
    mkdir -p ~/.viacoin/
    echo -e "rpcuser=rpc\nrpcpassword=rpcpw1234\nserver=1\ndaemon=1\ntxindex=1" > ~/.viacoin/viacoin.conf

Please then edit the ``~/.viacoin/viacoin.conf`` file and set the file to the same contents specified above in 
viacoin.conf example for Windows.

New Blockchain Download
^^^^^^^^^^^^^^^^^^^^^^^^

Next, if you haven't ever run ``viacoin-qt``/``viacoind`` on this machine (i.e. no blockchain has been downloaded),
you can just start ``viacoind``::

    viacoind

In either of the above cases, the viacoin server should now be started. The blockchain will begin to download automatically. You must let it finish 
downloading entirely before going to the next step. You can check the status of this by running::

     viacoind getinfo | grep blocks

When done, the block count returned by this command will match the value given from
`this page <http://blockexplorer.com/q/getblockcount>`__.

Already have Blockchain
^^^^^^^^^^^^^^^^^^^^^^^^

If you *have* already downloaded the blockchain before you modified your config and you did not have ``txindex=1`` 
enabled, you'll probably need to launch ``viacoind`` as follows:

    viacoind --reindex

    
This will start up viacoin to do a one time reindexing of the blockchain on disk. The reason this is is because we added the
``txindex=1`` configuration parameter above to the viacoin config file, which means that it will need to
run through the blockchain again to generate the necessary indexes, which may take a few hours. After doing
this once, you shouldn't have to do it again.

If you had the blockchain index parameter always turned on before, reindexing should not be necessary.

Next steps
^^^^^^^^^^^

At this point you should be good to go from a ``viacoind`` perspective.
For automatic startup of ``viacoind`` on system boot, `this page <https://viacointalk.org/index.php?topic=25518.0>`__
provides some good tips.
