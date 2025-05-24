// SPDX-License-Identifier: GPL-3.0
/*
    Copyright 2021 0KIMS association.

    This file is generated with [snarkJS](https://github.com/iden3/snarkjs).

    snarkJS is a free software: you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    snarkJS is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
    License for more details.

    You should have received a copy of the GNU General Public License
    along with snarkJS. If not, see <https://www.gnu.org/licenses/>.
*/

pragma solidity >=0.7.0 <0.9.0;

contract Groth16Verifier {
    // Scalar field size
    uint256 constant r    = 21888242871839275222246405745257275088548364400416034343698204186575808495617;
    // Base field size
    uint256 constant q   = 21888242871839275222246405745257275088696311157297823662689037894645226208583;

    // Verification Key data
    uint256 constant alphax  = 20491192805390485299153009773594534940189261866228447918068658471970481763042;
    uint256 constant alphay  = 9383485363053290200918347156157836566562967994039712273449902621266178545958;
    uint256 constant betax1  = 4252822878758300859123897981450591353533073413197771768651442665752259397132;
    uint256 constant betax2  = 6375614351688725206403948262868962793625744043794305715222011528459656738731;
    uint256 constant betay1  = 21847035105528745403288232691147584728191162732299865338377159692350059136679;
    uint256 constant betay2  = 10505242626370262277552901082094356697409835680220590971873171140371331206856;
    uint256 constant gammax1 = 11559732032986387107991004021392285783925812861821192530917403151452391805634;
    uint256 constant gammax2 = 10857046999023057135944570762232829481370756359578518086990519993285655852781;
    uint256 constant gammay1 = 4082367875863433681332203403145435568316851327593401208105741076214120093531;
    uint256 constant gammay2 = 8495653923123431417604973247489272438418190587263600148770280649306958101930;
    uint256 constant deltax1 = 12599857379517512478445603412764121041984228075771497593287716170335433683702;
    uint256 constant deltax2 = 7912208710313447447762395792098481825752520616755888860068004689933335666613;
    uint256 constant deltay1 = 11502426145685875357967720478366491326865907869902181704031346886834786027007;
    uint256 constant deltay2 = 21679208693936337484429571887537508926366191105267550375038502782696042114705;

    
    uint256 constant IC0x = 18995754531039749074567456850439161577175886556745850672908377518369009395943;
    uint256 constant IC0y = 18678412207620588544178018550323804434793638921481096604612200366949653495242;
    
    uint256 constant IC1x = 8578156830426636893430896380739829220748721642103075444883524445535745937319;
    uint256 constant IC1y = 8636836648155024556005999380771227216318892975336573339252932667009660613989;
    
    uint256 constant IC2x = 21376742694423185382893721801219295780430173043907650568374668212664996368885;
    uint256 constant IC2y = 20480570547751302633676079687556448402848985559929024046062928050558488379962;
    
    uint256 constant IC3x = 17777869227474717886908506264728232150162069555626895212288944971556081350991;
    uint256 constant IC3y = 21323810987752598250472486604263912500925743157203080203489009639446811767160;
    
    uint256 constant IC4x = 4413375985454952549002466653471167269904091768395499360548432993189049996506;
    uint256 constant IC4y = 5814773959891348413071572885363245629678179417829430157584359628733756980973;
    
    uint256 constant IC5x = 5775564994070830755499661176448881100934248227940780697458065253079488468933;
    uint256 constant IC5y = 20791879805008532310577269181260999972540989987863847078023570014708198131393;
    
    uint256 constant IC6x = 16451932764833952162242456393196509790765237517740956496611376721371251065876;
    uint256 constant IC6y = 2590095684959163825512939414942978280012359765281619172501335533518968447886;
    
    uint256 constant IC7x = 8559479272658203881241588557300902545977467656204765129303460808372287600183;
    uint256 constant IC7y = 4179499731923307063053848355169109989242732886597943149015824103114155186091;
    
    uint256 constant IC8x = 17343862925109684628476420653170777636809327295485446005755949009971102229704;
    uint256 constant IC8y = 10650281568104507673578669203295933973245425882013151443966160037761149649153;
    
    uint256 constant IC9x = 11317952066516921170630792358857493254922272414528111764475226007344254155716;
    uint256 constant IC9y = 3203354690010662515569102035335157276765722760601589730626602297760848173553;
    
    uint256 constant IC10x = 9720315647825219755043278070755273939578714583041180258748167122770396915526;
    uint256 constant IC10y = 9513803505969466256990392948889131687328311955145471946245599415044624539389;
    
    uint256 constant IC11x = 20124554357418166194728859956366039004558667512681467557657744849002381694669;
    uint256 constant IC11y = 5889037154684432408158632414607004969043532536263805097502742235315384775003;
    
    uint256 constant IC12x = 424003080546787314229295737091486683224852552667677843072621113172413664146;
    uint256 constant IC12y = 21809179249511456358030859622850451381988207908858823863852154687315429271248;
    
    uint256 constant IC13x = 17457527319998629476244587647596134286453449061364174511958368674090373000353;
    uint256 constant IC13y = 4921502918680369051783794844370753312133274425894584275280999087423227403865;
    
    uint256 constant IC14x = 15098189322390859326174418580669922094218067529475412999051176429552038079104;
    uint256 constant IC14y = 14822811639270416059873798050172869485005911782314268746237815606088167009833;
    
    uint256 constant IC15x = 4535924546957554151322007057581962483191902097768757477553151351591391837577;
    uint256 constant IC15y = 333527102238676760998113169838743317355031187193021042933873705165999718990;
    
    uint256 constant IC16x = 91487207589926952021234035578734136032224295859667924769844445860878753480;
    uint256 constant IC16y = 13295788660036870975766737231070469800403797246716890869164794929721776257236;
    
    uint256 constant IC17x = 18197477112227064592368241817570407550506683442766515176395306871271034275817;
    uint256 constant IC17y = 2431915480562657522364549146546941848174096060150340681350314590769149035355;
    
    uint256 constant IC18x = 19610251220860693662173520057432167964830961693654687411418048125945472065242;
    uint256 constant IC18y = 9926874038289536153287091623955062196344143924260617491137621282497661830651;
    
    uint256 constant IC19x = 21391680225876961775447537582165018773055027279221191557345280759251222715858;
    uint256 constant IC19y = 16236306904735693423959009229631410152399624688052276842132689922474861881093;
    
    uint256 constant IC20x = 5876987227862614090055422031750432134255907929000271980116845973834897863271;
    uint256 constant IC20y = 20046834671520819948377790829763796221555983372654275184882509158439243157255;
    
    uint256 constant IC21x = 1013263370798173008576556252631430938178885346137884768656701247273636317675;
    uint256 constant IC21y = 674368330752764321981144790378796002446577203127054122197256590364657312496;
    
    uint256 constant IC22x = 270632108603273410860495369346043061660972833259107164357713780845636200401;
    uint256 constant IC22y = 3480459769098808845746887292688983111755677576942366753002209940728008997849;
    
    uint256 constant IC23x = 12094604694203704236423912404658823769086322734065190425400675422342102001865;
    uint256 constant IC23y = 4690618274905095165630380474122979927758981453315156451341195546385431069710;
    
    uint256 constant IC24x = 16662155099269255780803926192532898629651938502203507826382758882242924631128;
    uint256 constant IC24y = 9519882969541627380771662252963119225559846476274022358145763819158246852618;
    
    uint256 constant IC25x = 4551405217531338413530588585793496872311002051776914743959932957888786957543;
    uint256 constant IC25y = 7231345865663750701456573023409337281983467421372583711947799778548136608955;
    
    uint256 constant IC26x = 1120371135326915887632436188884934601807866735953173975138530004673332374147;
    uint256 constant IC26y = 8147107413648664291609045217718755425046132349086432140794849286728792230186;
    
    uint256 constant IC27x = 8263732954245936095954600160070979144900768972327543648284744038807199987838;
    uint256 constant IC27y = 1554803469126532784999477630836252911353724900373996830379405767071515106607;
    
    uint256 constant IC28x = 13857320634574297438090546525583987863069548766680132218954287333893323065068;
    uint256 constant IC28y = 3574569101199169744525334846496480377072873921690948332463771166946282228790;
    
    uint256 constant IC29x = 19928928347295734817896966095572835472133833871276226248394266949805694356076;
    uint256 constant IC29y = 12892581480181237530340271267986712032514979284022278304401810435270585797127;
    
    uint256 constant IC30x = 12997033867431884984643782512642830576112278207508833183219320278438782860106;
    uint256 constant IC30y = 15718240548335864277986602096834400103094071912499756383306645109730300945634;
    
    uint256 constant IC31x = 10780981920606828629019490546998488045224572506004083327309704293391880768839;
    uint256 constant IC31y = 3618182347935639724832350691984390740387741824708855390437923060999496842542;
    
    uint256 constant IC32x = 14534095197166575110184847111245119583682509565740971759305353849212384834352;
    uint256 constant IC32y = 4252082426908226736805003902077960551842195782751871274856971164953915850855;
    
    uint256 constant IC33x = 6438350612987987926490644301199806521768086552939696064430220747956578141248;
    uint256 constant IC33y = 10110100304758600433760340937415754591465164610155189440195726159083498563856;
    
    uint256 constant IC34x = 2547669533904312513075166256061356016697204373341119784154023938998847375257;
    uint256 constant IC34y = 20284072532031670173709659729737472381425802384547676313180821643495197389614;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[34] calldata _pubSignals) public view returns (bool) {
        assembly {
            function checkField(v) {
                if iszero(lt(v, r)) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }
            
            // G1 function to multiply a G1 value(x,y) to value in an address
            function g1_mulAccC(pR, x, y, s) {
                let success
                let mIn := mload(0x40)
                mstore(mIn, x)
                mstore(add(mIn, 32), y)
                mstore(add(mIn, 64), s)

                success := staticcall(sub(gas(), 2000), 7, mIn, 96, mIn, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }

                mstore(add(mIn, 64), mload(pR))
                mstore(add(mIn, 96), mload(add(pR, 32)))

                success := staticcall(sub(gas(), 2000), 6, mIn, 128, pR, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }

            function checkPairing(pA, pB, pC, pubSignals, pMem) -> isOk {
                let _pPairing := add(pMem, pPairing)
                let _pVk := add(pMem, pVk)

                mstore(_pVk, IC0x)
                mstore(add(_pVk, 32), IC0y)

                // Compute the linear combination vk_x
                
                g1_mulAccC(_pVk, IC1x, IC1y, calldataload(add(pubSignals, 0)))
                
                g1_mulAccC(_pVk, IC2x, IC2y, calldataload(add(pubSignals, 32)))
                
                g1_mulAccC(_pVk, IC3x, IC3y, calldataload(add(pubSignals, 64)))
                
                g1_mulAccC(_pVk, IC4x, IC4y, calldataload(add(pubSignals, 96)))
                
                g1_mulAccC(_pVk, IC5x, IC5y, calldataload(add(pubSignals, 128)))
                
                g1_mulAccC(_pVk, IC6x, IC6y, calldataload(add(pubSignals, 160)))
                
                g1_mulAccC(_pVk, IC7x, IC7y, calldataload(add(pubSignals, 192)))
                
                g1_mulAccC(_pVk, IC8x, IC8y, calldataload(add(pubSignals, 224)))
                
                g1_mulAccC(_pVk, IC9x, IC9y, calldataload(add(pubSignals, 256)))
                
                g1_mulAccC(_pVk, IC10x, IC10y, calldataload(add(pubSignals, 288)))
                
                g1_mulAccC(_pVk, IC11x, IC11y, calldataload(add(pubSignals, 320)))
                
                g1_mulAccC(_pVk, IC12x, IC12y, calldataload(add(pubSignals, 352)))
                
                g1_mulAccC(_pVk, IC13x, IC13y, calldataload(add(pubSignals, 384)))
                
                g1_mulAccC(_pVk, IC14x, IC14y, calldataload(add(pubSignals, 416)))
                
                g1_mulAccC(_pVk, IC15x, IC15y, calldataload(add(pubSignals, 448)))
                
                g1_mulAccC(_pVk, IC16x, IC16y, calldataload(add(pubSignals, 480)))
                
                g1_mulAccC(_pVk, IC17x, IC17y, calldataload(add(pubSignals, 512)))
                
                g1_mulAccC(_pVk, IC18x, IC18y, calldataload(add(pubSignals, 544)))
                
                g1_mulAccC(_pVk, IC19x, IC19y, calldataload(add(pubSignals, 576)))
                
                g1_mulAccC(_pVk, IC20x, IC20y, calldataload(add(pubSignals, 608)))
                
                g1_mulAccC(_pVk, IC21x, IC21y, calldataload(add(pubSignals, 640)))
                
                g1_mulAccC(_pVk, IC22x, IC22y, calldataload(add(pubSignals, 672)))
                
                g1_mulAccC(_pVk, IC23x, IC23y, calldataload(add(pubSignals, 704)))
                
                g1_mulAccC(_pVk, IC24x, IC24y, calldataload(add(pubSignals, 736)))
                
                g1_mulAccC(_pVk, IC25x, IC25y, calldataload(add(pubSignals, 768)))
                
                g1_mulAccC(_pVk, IC26x, IC26y, calldataload(add(pubSignals, 800)))
                
                g1_mulAccC(_pVk, IC27x, IC27y, calldataload(add(pubSignals, 832)))
                
                g1_mulAccC(_pVk, IC28x, IC28y, calldataload(add(pubSignals, 864)))
                
                g1_mulAccC(_pVk, IC29x, IC29y, calldataload(add(pubSignals, 896)))
                
                g1_mulAccC(_pVk, IC30x, IC30y, calldataload(add(pubSignals, 928)))
                
                g1_mulAccC(_pVk, IC31x, IC31y, calldataload(add(pubSignals, 960)))
                
                g1_mulAccC(_pVk, IC32x, IC32y, calldataload(add(pubSignals, 992)))
                
                g1_mulAccC(_pVk, IC33x, IC33y, calldataload(add(pubSignals, 1024)))
                
                g1_mulAccC(_pVk, IC34x, IC34y, calldataload(add(pubSignals, 1056)))
                

                // -A
                mstore(_pPairing, calldataload(pA))
                mstore(add(_pPairing, 32), mod(sub(q, calldataload(add(pA, 32))), q))

                // B
                mstore(add(_pPairing, 64), calldataload(pB))
                mstore(add(_pPairing, 96), calldataload(add(pB, 32)))
                mstore(add(_pPairing, 128), calldataload(add(pB, 64)))
                mstore(add(_pPairing, 160), calldataload(add(pB, 96)))

                // alpha1
                mstore(add(_pPairing, 192), alphax)
                mstore(add(_pPairing, 224), alphay)

                // beta2
                mstore(add(_pPairing, 256), betax1)
                mstore(add(_pPairing, 288), betax2)
                mstore(add(_pPairing, 320), betay1)
                mstore(add(_pPairing, 352), betay2)

                // vk_x
                mstore(add(_pPairing, 384), mload(add(pMem, pVk)))
                mstore(add(_pPairing, 416), mload(add(pMem, add(pVk, 32))))


                // gamma2
                mstore(add(_pPairing, 448), gammax1)
                mstore(add(_pPairing, 480), gammax2)
                mstore(add(_pPairing, 512), gammay1)
                mstore(add(_pPairing, 544), gammay2)

                // C
                mstore(add(_pPairing, 576), calldataload(pC))
                mstore(add(_pPairing, 608), calldataload(add(pC, 32)))

                // delta2
                mstore(add(_pPairing, 640), deltax1)
                mstore(add(_pPairing, 672), deltax2)
                mstore(add(_pPairing, 704), deltay1)
                mstore(add(_pPairing, 736), deltay2)


                let success := staticcall(sub(gas(), 2000), 8, _pPairing, 768, _pPairing, 0x20)

                isOk := and(success, mload(_pPairing))
            }

            let pMem := mload(0x40)
            mstore(0x40, add(pMem, pLastMem))

            // Validate that all evaluations ∈ F
            
            checkField(calldataload(add(_pubSignals, 0)))
            
            checkField(calldataload(add(_pubSignals, 32)))
            
            checkField(calldataload(add(_pubSignals, 64)))
            
            checkField(calldataload(add(_pubSignals, 96)))
            
            checkField(calldataload(add(_pubSignals, 128)))
            
            checkField(calldataload(add(_pubSignals, 160)))
            
            checkField(calldataload(add(_pubSignals, 192)))
            
            checkField(calldataload(add(_pubSignals, 224)))
            
            checkField(calldataload(add(_pubSignals, 256)))
            
            checkField(calldataload(add(_pubSignals, 288)))
            
            checkField(calldataload(add(_pubSignals, 320)))
            
            checkField(calldataload(add(_pubSignals, 352)))
            
            checkField(calldataload(add(_pubSignals, 384)))
            
            checkField(calldataload(add(_pubSignals, 416)))
            
            checkField(calldataload(add(_pubSignals, 448)))
            
            checkField(calldataload(add(_pubSignals, 480)))
            
            checkField(calldataload(add(_pubSignals, 512)))
            
            checkField(calldataload(add(_pubSignals, 544)))
            
            checkField(calldataload(add(_pubSignals, 576)))
            
            checkField(calldataload(add(_pubSignals, 608)))
            
            checkField(calldataload(add(_pubSignals, 640)))
            
            checkField(calldataload(add(_pubSignals, 672)))
            
            checkField(calldataload(add(_pubSignals, 704)))
            
            checkField(calldataload(add(_pubSignals, 736)))
            
            checkField(calldataload(add(_pubSignals, 768)))
            
            checkField(calldataload(add(_pubSignals, 800)))
            
            checkField(calldataload(add(_pubSignals, 832)))
            
            checkField(calldataload(add(_pubSignals, 864)))
            
            checkField(calldataload(add(_pubSignals, 896)))
            
            checkField(calldataload(add(_pubSignals, 928)))
            
            checkField(calldataload(add(_pubSignals, 960)))
            
            checkField(calldataload(add(_pubSignals, 992)))
            
            checkField(calldataload(add(_pubSignals, 1024)))
            
            checkField(calldataload(add(_pubSignals, 1056)))
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
