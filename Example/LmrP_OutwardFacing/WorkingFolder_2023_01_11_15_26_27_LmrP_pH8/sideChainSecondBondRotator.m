function secondBondRotatedSideChain = sideChainSecondBondRotator(formatedSideChain, rotatingAngle)
    residueType = formatedSideChain(1, 5);
    if residueType == "GLY" || residueType == "PRO" || residueType == "ALA" || ...
        residueType == "VAL" || residueType == "CYS" || residueType == "SER" || ...
        residueType == "THR" 
        secondBondRotatedSideChain = formatedSideChain;
    elseif residueType == "ARG" 
        sideChainCoordinates = double(formatedSideChain(:, 9:11));
        sideChainTargetCBCoordinates = double(formatedSideChain(formatedSideChain(:, 3) == " CB ", 9:11));
        firstMovedSideChainCoordinates = sideChainCoordinates-sideChainTargetCBCoordinates;
        ARGRotatingMatrix = rotatingMatrixGenerator(firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CG ", :), ((rand(1, 1)-0.5)*rotatingAngle)/180*pi);
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CD " |...
                     formatedSideChain(:, 3) == " NE " |...
                     formatedSideChain(:, 3) == " CZ " |...
                     formatedSideChain(:, 3) == " NH1" |...
                     formatedSideChain(:, 3) == " NH2", :) = ...
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CD " |...
                     formatedSideChain(:, 3) == " NE " |...
                     formatedSideChain(:, 3) == " CZ " |...
                     formatedSideChain(:, 3) == " NH1" |...
                     formatedSideChain(:, 3) == " NH2", :)*ARGRotatingMatrix;
        secondMovedSideChainCoordinates = firstMovedSideChainCoordinates+sideChainTargetCBCoordinates;
        secondBondRotatedSideChainTmp = formatedSideChain;
        secondBondRotatedSideChainTmp(:, 9:11, :) = string(secondMovedSideChainCoordinates);
        secondBondRotatedSideChain = secondBondRotatedSideChainTmp;
    elseif residueType == "HIS" 
        sideChainCoordinates = double(formatedSideChain(:, 9:11));
        sideChainTargetCBCoordinates = double(formatedSideChain(formatedSideChain(:, 3) == " CB ", 9:11));
        firstMovedSideChainCoordinates = sideChainCoordinates-sideChainTargetCBCoordinates;
        HISRotatingMatrix = rotatingMatrixGenerator(firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CG ", :), ((rand(1, 1)-0.5)*rotatingAngle)/180*pi);
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CD2" |...
                     formatedSideChain(:, 3) == " ND1" |...
                     formatedSideChain(:, 3) == " CE1" |...
                     formatedSideChain(:, 3) == " NE2", :) = ...
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CD2" |...
                     formatedSideChain(:, 3) == " ND1" |...
                     formatedSideChain(:, 3) == " CE1" |...
                     formatedSideChain(:, 3) == " NE2", :)*HISRotatingMatrix;
        secondMovedSideChainCoordinates = firstMovedSideChainCoordinates+sideChainTargetCBCoordinates;
        secondBondRotatedSideChainTmp = formatedSideChain;
        secondBondRotatedSideChainTmp(:, 9:11, :) = string(secondMovedSideChainCoordinates);
        secondBondRotatedSideChain = secondBondRotatedSideChainTmp;
    elseif residueType == "LYS" 
        sideChainCoordinates = double(formatedSideChain(:, 9:11));
        sideChainTargetCBCoordinates = double(formatedSideChain(formatedSideChain(:, 3) == " CB ", 9:11));
        firstMovedSideChainCoordinates = sideChainCoordinates-sideChainTargetCBCoordinates;
        LYSRotatingMatrix = rotatingMatrixGenerator(firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CG ", :), ((rand(1, 1)-0.5)*rotatingAngle)/180*pi);
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CD " |...
                     formatedSideChain(:, 3) == " CE " |...
                     formatedSideChain(:, 3) == " NZ ", :) = ...
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CD " |...
                     formatedSideChain(:, 3) == " CE " |...
                     formatedSideChain(:, 3) == " NZ ", :)*LYSRotatingMatrix;
        secondMovedSideChainCoordinates = firstMovedSideChainCoordinates+sideChainTargetCBCoordinates;
        secondBondRotatedSideChainTmp = formatedSideChain;
        secondBondRotatedSideChainTmp(:, 9:11, :) = string(secondMovedSideChainCoordinates);
        secondBondRotatedSideChain = secondBondRotatedSideChainTmp;
    elseif residueType == "ASP" 
        sideChainCoordinates = double(formatedSideChain(:, 9:11));
        sideChainTargetCBCoordinates = double(formatedSideChain(formatedSideChain(:, 3) == " CB ", 9:11));
        firstMovedSideChainCoordinates = sideChainCoordinates-sideChainTargetCBCoordinates;
        ASPRotatingMatrix = rotatingMatrixGenerator(firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CG ", :), ((rand(1, 1)-0.5)*rotatingAngle)/180*pi);
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " OD1" |...
                     formatedSideChain(:, 3) == " OD2", :) = ...
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " OD1" |...
                     formatedSideChain(:, 3) == " OD2", :)*ASPRotatingMatrix;
        secondMovedSideChainCoordinates = firstMovedSideChainCoordinates+sideChainTargetCBCoordinates;
        secondBondRotatedSideChainTmp = formatedSideChain;
        secondBondRotatedSideChainTmp(:, 9:11, :) = string(secondMovedSideChainCoordinates);
        secondBondRotatedSideChain = secondBondRotatedSideChainTmp;
    elseif residueType == "GLU" 
        sideChainCoordinates = double(formatedSideChain(:, 9:11));
        sideChainTargetCBCoordinates = double(formatedSideChain(formatedSideChain(:, 3) == " CB ", 9:11));
        firstMovedSideChainCoordinates = sideChainCoordinates-sideChainTargetCBCoordinates;
        GLURotatingMatrix = rotatingMatrixGenerator(firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CG ", :), ((rand(1, 1)-0.5)*rotatingAngle)/180*pi);
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CD " |...
                     formatedSideChain(:, 3) == " OE1" |...
                     formatedSideChain(:, 3) == " OE2", :) = ...
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CD " |...
                     formatedSideChain(:, 3) == " OE1" |...
                     formatedSideChain(:, 3) == " OE2", :)*GLURotatingMatrix;
        secondMovedSideChainCoordinates = firstMovedSideChainCoordinates+sideChainTargetCBCoordinates;
        secondBondRotatedSideChainTmp = formatedSideChain;
        secondBondRotatedSideChainTmp(:, 9:11, :) = string(secondMovedSideChainCoordinates);
        secondBondRotatedSideChain = secondBondRotatedSideChainTmp;
    elseif residueType == "ASN" 
        sideChainCoordinates = double(formatedSideChain(:, 9:11));
        sideChainTargetCBCoordinates = double(formatedSideChain(formatedSideChain(:, 3) == " CB ", 9:11));
        firstMovedSideChainCoordinates = sideChainCoordinates-sideChainTargetCBCoordinates;
        ASNRotatingMatrix = rotatingMatrixGenerator(firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CG ", :), ((rand(1, 1)-0.5)*rotatingAngle)/180*pi);
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " ND2" |...
                     formatedSideChain(:, 3) == " OD1", :) = ...
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " ND2" |...
                     formatedSideChain(:, 3) == " OD1", :)*ASNRotatingMatrix;
        secondMovedSideChainCoordinates = firstMovedSideChainCoordinates+sideChainTargetCBCoordinates;
        secondBondRotatedSideChainTmp = formatedSideChain;
        secondBondRotatedSideChainTmp(:, 9:11, :) = string(secondMovedSideChainCoordinates);
        secondBondRotatedSideChain = secondBondRotatedSideChainTmp;
    elseif residueType == "GLN" 
        sideChainCoordinates = double(formatedSideChain(:, 9:11));
        sideChainTargetCBCoordinates = double(formatedSideChain(formatedSideChain(:, 3) == " CB ", 9:11));
        firstMovedSideChainCoordinates = sideChainCoordinates-sideChainTargetCBCoordinates;
        GLNRotatingMatrix = rotatingMatrixGenerator(firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CG ", :), ((rand(1, 1)-0.5)*rotatingAngle)/180*pi);
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CD " |...
                     formatedSideChain(:, 3) == " NE2" |...
                     formatedSideChain(:, 3) == " OE1", :) = ...
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CD " |...
                     formatedSideChain(:, 3) == " NE2" |...
                     formatedSideChain(:, 3) == " OE1", :)*GLNRotatingMatrix;
        secondMovedSideChainCoordinates = firstMovedSideChainCoordinates+sideChainTargetCBCoordinates;
        secondBondRotatedSideChainTmp = formatedSideChain;
        secondBondRotatedSideChainTmp(:, 9:11, :) = string(secondMovedSideChainCoordinates);
        secondBondRotatedSideChain = secondBondRotatedSideChainTmp;
    elseif residueType == "ILE" 
        sideChainCoordinates = double(formatedSideChain(:, 9:11));
        sideChainTargetCBCoordinates = double(formatedSideChain(formatedSideChain(:, 3) == " CB ", 9:11));
        firstMovedSideChainCoordinates = sideChainCoordinates-sideChainTargetCBCoordinates;
        ILERotatingMatrix = rotatingMatrixGenerator(firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CG1", :), ((rand(1, 1)-0.5)*rotatingAngle)/180*pi);
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CD1", :) = ...
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CD1", :)*ILERotatingMatrix;
        secondMovedSideChainCoordinates = firstMovedSideChainCoordinates+sideChainTargetCBCoordinates;
        secondBondRotatedSideChainTmp = formatedSideChain;
        secondBondRotatedSideChainTmp(:, 9:11, :) = string(secondMovedSideChainCoordinates);
        secondBondRotatedSideChain = secondBondRotatedSideChainTmp;
    elseif residueType == "LEU" 
        sideChainCoordinates = double(formatedSideChain(:, 9:11));
        sideChainTargetCBCoordinates = double(formatedSideChain(formatedSideChain(:, 3) == " CB ", 9:11));
        firstMovedSideChainCoordinates = sideChainCoordinates-sideChainTargetCBCoordinates;
        LEURotatingMatrix = rotatingMatrixGenerator(firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CG ", :), ((rand(1, 1)-0.5)*rotatingAngle)/180*pi);
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CD1" |...
                     formatedSideChain(:, 3) == " CD2", :) = ...
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CD1" |...
                     formatedSideChain(:, 3) == " CD2", :)*LEURotatingMatrix;
        secondMovedSideChainCoordinates = firstMovedSideChainCoordinates+sideChainTargetCBCoordinates;
        secondBondRotatedSideChainTmp = formatedSideChain;
        secondBondRotatedSideChainTmp(:, 9:11, :) = string(secondMovedSideChainCoordinates);
        secondBondRotatedSideChain = secondBondRotatedSideChainTmp;
    elseif residueType == "MET" 
        sideChainCoordinates = double(formatedSideChain(:, 9:11));
        sideChainTargetCBCoordinates = double(formatedSideChain(formatedSideChain(:, 3) == " CB ", 9:11));
        firstMovedSideChainCoordinates = sideChainCoordinates-sideChainTargetCBCoordinates;
        METRotatingMatrix = rotatingMatrixGenerator(firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CG ", :), ((rand(1, 1)-0.5)*rotatingAngle)/180*pi);
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " SD " |...
                     formatedSideChain(:, 3) == " CE ", :) = ...
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " SD " |...
                     formatedSideChain(:, 3) == " CE ", :)*METRotatingMatrix;
        secondMovedSideChainCoordinates = firstMovedSideChainCoordinates+sideChainTargetCBCoordinates;
        secondBondRotatedSideChainTmp = formatedSideChain;
        secondBondRotatedSideChainTmp(:, 9:11, :) = string(secondMovedSideChainCoordinates);
        secondBondRotatedSideChain = secondBondRotatedSideChainTmp;
    elseif residueType == "PHE" 
        sideChainCoordinates = double(formatedSideChain(:, 9:11));
        sideChainTargetCBCoordinates = double(formatedSideChain(formatedSideChain(:, 3) == " CB ", 9:11));
        firstMovedSideChainCoordinates = sideChainCoordinates-sideChainTargetCBCoordinates;
        PHERotatingMatrix = rotatingMatrixGenerator(firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CG ", :), ((rand(1, 1)-0.5)*rotatingAngle)/180*pi);
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CD1" |...
                     formatedSideChain(:, 3) == " CD2" |...
                     formatedSideChain(:, 3) == " CE1" |...
                     formatedSideChain(:, 3) == " CE2" |...
                     formatedSideChain(:, 3) == " CZ ", :) = ...
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CD1" |...
                     formatedSideChain(:, 3) == " CD2" |...
                     formatedSideChain(:, 3) == " CE1" |...
                     formatedSideChain(:, 3) == " CE2" |...
                     formatedSideChain(:, 3) == " CZ ", :)*PHERotatingMatrix;
        secondMovedSideChainCoordinates = firstMovedSideChainCoordinates+sideChainTargetCBCoordinates;
        secondBondRotatedSideChainTmp = formatedSideChain;
        secondBondRotatedSideChainTmp(:, 9:11, :) = string(secondMovedSideChainCoordinates);
        secondBondRotatedSideChain = secondBondRotatedSideChainTmp;
    elseif residueType == "TYR" 
        sideChainCoordinates = double(formatedSideChain(:, 9:11));
        sideChainTargetCBCoordinates = double(formatedSideChain(formatedSideChain(:, 3) == " CB ", 9:11));
        firstMovedSideChainCoordinates = sideChainCoordinates-sideChainTargetCBCoordinates;
        TYRRotatingMatrix = rotatingMatrixGenerator(firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CG ", :), ((rand(1, 1)-0.5)*rotatingAngle)/180*pi);
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CD1" |...
                     formatedSideChain(:, 3) == " CD2" |...
                     formatedSideChain(:, 3) == " CE1" |...
                     formatedSideChain(:, 3) == " CE2" |...
                     formatedSideChain(:, 3) == " CZ " |...
                     formatedSideChain(:, 3) == " OH ", :) = ...
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CD1" |...
                     formatedSideChain(:, 3) == " CD2" |...
                     formatedSideChain(:, 3) == " CE1" |...
                     formatedSideChain(:, 3) == " CE2" |...
                     formatedSideChain(:, 3) == " CZ " |...
                     formatedSideChain(:, 3) == " OH ", :)*TYRRotatingMatrix;
        secondMovedSideChainCoordinates = firstMovedSideChainCoordinates+sideChainTargetCBCoordinates;
        secondBondRotatedSideChainTmp = formatedSideChain;
        secondBondRotatedSideChainTmp(:, 9:11, :) = string(secondMovedSideChainCoordinates);
        secondBondRotatedSideChain = secondBondRotatedSideChainTmp;
    elseif residueType == "TRP" 
        sideChainCoordinates = double(formatedSideChain(:, 9:11));
        sideChainTargetCBCoordinates = double(formatedSideChain(formatedSideChain(:, 3) == " CB ", 9:11));
        firstMovedSideChainCoordinates = sideChainCoordinates-sideChainTargetCBCoordinates;
        TRPRotatingMatrix = rotatingMatrixGenerator(firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CG ", :), ((rand(1, 1)-0.5)*rotatingAngle)/180*pi);
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CD1" |...
                     formatedSideChain(:, 3) == " CD2" |...
                     formatedSideChain(:, 3) == " CE2" |...
                     formatedSideChain(:, 3) == " CE3" |...
                     formatedSideChain(:, 3) == " NE1" |...
                     formatedSideChain(:, 3) == " CZ2" |...
                     formatedSideChain(:, 3) == " CZ3" |...
                     formatedSideChain(:, 3) == " CH2", :) = ...
        firstMovedSideChainCoordinates(formatedSideChain(:, 3) == " CD1" |...
                     formatedSideChain(:, 3) == " CD2" |...
                     formatedSideChain(:, 3) == " CE2" |...
                     formatedSideChain(:, 3) == " CE3" |...
                     formatedSideChain(:, 3) == " NE1" |...
                     formatedSideChain(:, 3) == " CZ2" |...
                     formatedSideChain(:, 3) == " CZ3" |...
                     formatedSideChain(:, 3) == " CH2", :)*TRPRotatingMatrix;
        secondMovedSideChainCoordinates = firstMovedSideChainCoordinates+sideChainTargetCBCoordinates;
        secondBondRotatedSideChainTmp = formatedSideChain;
        secondBondRotatedSideChainTmp(:, 9:11, :) = string(secondMovedSideChainCoordinates);
        secondBondRotatedSideChain = secondBondRotatedSideChainTmp;
    end
end