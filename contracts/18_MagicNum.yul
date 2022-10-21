// solc contracts/18_MagicNum.yul --strict-assembly --optimize
// bytecode => 600a80600d600039806000f3fe602a60005260206000f3
//                  deployed bytecode => 602a60805260206080f3
object "AttackerMagicNum" {
    code {
        datacopy(0, dataoffset("runtime"), datasize("runtime"))
        return(0, datasize("runtime"))
    }
    object "runtime" {
        code {
            mstore(0, 42)
            return(0, 0x20)
        }
    }
}

  
