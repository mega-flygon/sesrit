--((landed[(tetromino.topLeft.y - 1) + 3][(tetromino.topLeft.x - 1) + 4] == 1) or
--(landed[(tetromino.topLeft.y - 1) + 3][(tetromino.topLeft.x - 1) + 2] == 1) or
--(landed[(tetromino.topLeft.y - 1) + 3][(tetromino.topLeft.x - 1) + 1] == 1))

-- HEY RIGHT HERE: make block img array, draw based on shape key

-- vertical right collision doesn't go up ???

-- the actual rotation
-- the collision detection

--GLOBAL CONSTANT ADDED TO DRAW TO CHANGE LOCATION ON SCREEN

-- (y, x) == (row, col)

--to do
--  + so when you try to go off screen right it does not collide properly
--  + not removing bottom row after first completion?  lol
--  + fix wall collisions, left/right control collisions

-- for each new shape, you must:
--  + define rotations
--  + define in rotate collide function

-- CHECK ROTATE: does this:
--    take in shape key and form
--    find corresponding block
--    check for LEFT COLLISION    YOU HAVE TO CHECK FOR AS IF IT IS GOING TO BE SHIFTED FOR EACH
--    check for RIGHT COLLISIOn
--    store boolean for left and right BEFORE DOING ANYTHING
--    use L/R booleans to decide what to do, i.e.:
--      + if will collide left but not right, shift right until no collision
--      + vice versa.  if both collisions, do NOTHING

landed = {
  [1] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [2] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [3] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [4] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [5] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [6] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [7] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [8] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [9] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [10] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [11] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [12] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [13] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [14] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [15] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [16] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [17] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [18] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [19] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [20] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [21] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [22] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [23] =  { [-1] = 1, [0] = 1, [1] = 1, [2] = 1, [3] = 1, [4] = 1, [5] = 1, [6] = 1, [7] = 1, [8] = 1, [9] = 1, [10] = 1, [11] = 1},
  [24] =  { [-1] = 1, [0] = 1, [1] = 7, [2] = 7, [3] = 7, [4] = 7, [5] = 7, [6] = 7, [7] = 7, [8] = 7, [9] = 7, [10] = 7, [11] = 7},
  [25] =  { [-1] = 1, [0] = 1, [1] = 7, [2] = 7, [3] = 7, [4] = 7, [5] = 7, [6] = 7, [7] = 7, [8] = 7, [9] = 7, [10] = 7, [11] = 7},
}

landedColors = {
  [1] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [2] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [3] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [4] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [5] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [6] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [7] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [8] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [9] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [10] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [11] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [12] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [13] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [14] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [15] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [16] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [17] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [18] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [19] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [20] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [21] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [22] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [23] =  { [-1] = 1, [0] = 1, [1] = 1, [2] = 1, [3] = 1, [4] = 1, [5] = 1, [6] = 1, [7] = 1, [8] = 1, [9] = 1, [10] = 1, [11] = 1},
  [24] =  { [-1] = 1, [0] = 1, [1] = 7, [2] = 7, [3] = 7, [4] = 7, [5] = 7, [6] = 7, [7] = 7, [8] = 7, [9] = 7, [10] = 7, [11] = 7},
  [25] =  { [-1] = 1, [0] = 1, [1] = 7, [2] = 7, [3] = 7, [4] = 7, [5] = 7, [6] = 7, [7] = 7, [8] = 7, [9] = 7, [10] = 7, [11] = 7},
} 

tetroBlocks = { [1] = nil, [2] = nil, [3] = nil, [4] = nil, [5] = nil, [6] = nil, [7] = nil, [8] = nil }
canFall = nil
leftMostCol = 20

function leftCollide()
  leftMostCol = 3
  for i = 1, 4 do
    for j = 3, 0, -1 do
      if tetromino.shape[i][j] == 1 then
        if j < leftMostCol then
          leftMostCol = j
        end
      end
    end
  end
  for i = 1, 4 do  -- testing for left collision
    if tetromino.shape[i][leftMostCol] == 1 then
      if landed[tetromino.topLeft.y + (i - 1)][(tetromino.topLeft.x + (leftMostCol - 1)) - 1] == 1 then
        return true
      end
    end
  end
  return false
end

function rightCollide()
  rightMostCol = 1
  for i = 1, 4 do
    for j = 1, 4 do
      if tetromino.shape[i][j] == 1 then
        if j > rightMostCol then
          rightMostCol = j
        end
      end
    end
  end
  for i = 1, 4 do
    if tetromino.shape[i][rightMostCol] == 1 then
      if landed[tetromino.topLeft.y + (i - 1)][tetromino.topLeft.x + (rightMostCol - 1) + 1] == 1 then
        return true
      end
    end
  end
  return false
end


function findPlace(shapeKey, shapeForm)
  nextShape = { [1] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
                [2] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
                [3] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
                [4] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 } }
  
  for row = 1, 4 do
    for col = 1, 4 do
      nextShape[row][col] = tetromino.shape[row][col]
    end
  end
  
  nextShape.form = tetromino.shape.form
  
  rotate(nextShape)
  
  tetroBlocks = { [1] = nil, [2] = nil, [3] = nil, [4] = nil, [5] = nil, [6] = nil, [7] = nil, [8] = nil }
  blocksFound = 0
  index = 1
  while (blocksFound < 4) do
    for row = 1, 4 do
      for col = 1, 4 do
        if nextShape[row][col] == 1 then
          tetroBlocks[index] = row
          index = index + 1
          tetroBlocks[index] = col
          index = index + 1
          blocksFound = blocksFound + 1
        end
      end
    end
  end

  r1 = (tetromino.topLeft.y - 1) + tetroBlocks[1]
  c1 = (tetromino.topLeft.x - 1) + tetroBlocks[2]
  r2 = (tetromino.topLeft.y - 1) + tetroBlocks[3]
  c2 = (tetromino.topLeft.x - 1) + tetroBlocks[4]
  r3 = (tetromino.topLeft.y - 1) + tetroBlocks[5]
  c3 = (tetromino.topLeft.x - 1) + tetroBlocks[6]
  r4 = (tetromino.topLeft.y - 1) + tetroBlocks[7]
  c4 = (tetromino.topLeft.x - 1) + tetroBlocks[8]
  -- everything above here in function works as intended
  i = 0
  foundSpot = false
  while i <= 2 and (not foundSpot) do
    if (landed[r1][c1 + i]) == 0 and (landed[r2][c2 + i]) == 0 and (landed[r3][c3 + i]) == 0 and (landed[r4][c4 + i] == 0) then
      foundSpot = true
      tetromino.topLeft.x = tetromino.topLeft.x + i
      tetromino.potentialTopLeft.x = tetromino.potentialTopLeft.x + i
      rotate(tetromino.shape)
      return true
    end
    if (landed[r1][c1 - i] == 0) and (landed[r2][c2 - i] == 0) and (landed[r3][c3 - i] == 0) and (landed[r4][c4 - i] == 0) then
      foundSpot = true
      tetromino.topLeft.x = tetromino.topLeft.x - i
      tetromino.potentialTopLeft.x = tetromino.potentialTopLeft.x - i
      rotate(tetromino.shape)
      return true
    end
    if (landed[r1 - i][c1]) == 0 and (landed[r2 - i][c2]) == 0 and (landed[r3 - i][c3]) == 0 and (landed[r4 - i][c4] == 0) then
      foundSpot = true
      tetromino.topLeft.y = tetromino.topLeft.y - i
      tetromino.potentialTopLeft.y = tetromino.potentialTopLeft.y - i
      rotate(tetromino.shape)
      return true
    end
    i = i + 1
    end
  return false  
end

function rotate(shape)  
  
  if shapeKey == 2 then
    if shape.form == 1 then
      shape[2][1] = 0
      shape[2][2] = 0
      shape[2][4] = 0
      shape[1][3] = 1
      shape[3][3] = 1
      shape[4][3] = 1
    end
    if shape.form == 2 then
      shape[3][4] = 1
      shape[3][2] = 1
      shape[3][1] = 1
      shape[1][3] = 0
      shape[2][3] = 0
      shape[4][3] = 0
    end
    if shape.form == 3 then
      shape[3][1] = 0
      shape[3][3] = 0
      shape[3][4] = 0
      shape[1][2] = 1
      shape[2][2] = 1
      shape[4][2] = 1
    end
    if shape.form == 4 then
      shape[1][2] = 0
      shape[3][2] = 0
      shape[4][2] = 0
      shape[2][1] = 1
      shape[2][3] = 1
      shape[2][4] = 1
    end
  end
  
  if shapeKey == 3 then
    if shape.form == 1 then
      shape[1][1] = 0
      shape[2][1] = 0
      shape[2][3] = 0
      shape[1][2] = 1
      shape[1][3] = 1
      shape[3][2] = 1
    end
    if shape.form == 2 then
      shape[1][2] = 0
      shape[1][3] = 0
      shape[3][2] = 0
      shape[2][1] = 1
      shape[2][3] = 1
      shape[3][3] = 1
    end
    if shape.form == 3 then
      shape[2][1] = 0
      shape[2][3] = 0
      shape[3][3] = 0
      shape[1][2] = 1
      shape[3][1] = 1
      shape[3][2] = 1
    end
    if shape.form == 4 then
      shape[1][2] = 0
      shape[3][1] = 0
      shape[3][2] = 0
      shape[1][1] = 1
      shape[2][1] = 1
      shape[2][3] = 1
    end
  end  
  
  if shapeKey == 4 then
    if shape.form == 1 then
      shape[1][3] = 0
      shape[2][1] = 0
      shape[2][3] = 0
      shape[1][2] = 1
      shape[3][2] = 1
      shape[3][3] = 1
    end
    if shape.form == 2 then
      shape[1][2] = 0
      shape[3][2] = 0
      shape[3][3] = 0
      shape[2][1] = 1
      shape[2][3] = 1
      shape[3][1] = 1
    end
    if shape.form == 3 then
      shape[2][1] = 0
      shape[2][3] = 0
      shape[3][1] = 0
      shape[1][1] = 1
      shape[1][2] = 1
      shape[3][2] = 1
    end
    if shape.form == 4 then
      shape[1][1] = 0
      shape[1][2] = 0
      shape[3][2] = 0
      shape[1][3] = 1
      shape[2][1] = 1
      shape[2][3] = 1
    end
  end  
  
  if shapeKey == 5 then
    if shape.form == 1 then
      shape[1][3] = 0
      shape[2][1] = 0
      shape[2][3] = 1
      shape[3][3] = 1
    end
    if shape.form == 2 then
      shape[1][2] = 0
      shape[3][3] = 0
      shape[3][1] = 1
      shape[3][2] = 1
    end
    if shape.form == 3 then
      shape[2][3] = 0
      shape[3][1] = 0
      shape[1][1] = 1
      shape[2][1] = 1
    end
    if shape.form == 4 then
      shape[1][1] = 0
      shape[3][2] = 0
      shape[1][2] = 1
      shape[1][3] = 1
    end
  end
  
  if shapeKey == 6 then
    if shape.form == 1 then
      shape[2][1] = 0
      shape[3][2] = 1
    end
    if shape.form == 2 then
      shape[1][2] = 0
      shape[2][1] = 1
    end
    if shape.form == 3 then
      shape[2][3] = 0
      shape[1][2] = 1
    end
    if shape.form == 4 then
      shape[3][2] = 0
      shape[2][3] = 1
    end
  end
  
  if shapeKey == 7 then
    if shape.form == 1 then
      shape[1][1] = 0
      shape[1][2] = 0
      shape[1][3] = 1
      shape[3][2] = 1
    end
    if shape.form == 2 then
      shape[1][3] = 0
      shape[2][3] = 0
      shape[2][1] = 1
      shape[3][3] = 1
    end
    if shape.form == 3 then
      shape[3][2] = 0
      shape[3][3] = 0
      shape[3][1] = 1
      shape[1][2] = 1
    end
    if shape.form == 4 then
      shape[2][1] = 0
      shape[3][1] = 0
      shape[1][1] = 1
      shape[2][3] = 1
    end
  end
end

oShape = { [1] = { [1] = 1, [2] = 1, [3] = 0, [4] = 0 }, 
           [2] = { [1] = 1, [2] = 1, [3] = 0, [4] = 0 }, 
           [3] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
           [4] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 } }

iShape = { [1] = { [1] = 0, [2] = 0, [3] = 1, [4] = 0 }, 
           [2] = { [1] = 0, [2] = 0, [3] = 1, [4] = 0 }, 
           [3] = { [1] = 0, [2] = 0, [3] = 1, [4] = 0 }, 
           [4] = { [1] = 0, [2] = 0, [3] = 1, [4] = 0 }, }
         
jShape = { [1] = { [1] = 1, [2] = 0, [3] = 0, [4] = 0 }, 
           [2] = { [1] = 1, [2] = 1, [3] = 1, [4] = 0 }, 
           [3] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
           [4] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 } }
         
lShape = { [1] = { [1] = 0, [2] = 0, [3] = 1, [4] = 0 }, 
           [2] = { [1] = 1, [2] = 1, [3] = 1, [4] = 0 }, 
           [3] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
           [4] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 } }
         
sShape = { [1] = { [1] = 0, [2] = 1, [3] = 1, [4] = 0 }, 
           [2] = { [1] = 1, [2] = 1, [3] = 0, [4] = 0 }, 
           [3] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
           [4] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 } }
         
tShape = { [1] = { [1] = 0, [2] = 1, [3] = 0, [4] = 0 }, 
           [2] = { [1] = 1, [2] = 1, [3] = 1, [4] = 0 }, 
           [3] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
           [4] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 } }
         
zShape = { [1] = { [1] = 1, [2] = 1, [3] = 0, [4] = 0 }, 
           [2] = { [1] = 0, [2] = 1, [3] = 1, [4] = 0 }, 
           [3] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
           [4] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 } }
         
shapeTable = { [1] = oShape, [2] = iShape, [3] = jShape, [4] = lShape, [5] = sShape, [6] = tShape, [7] = zShape }
debugBlock = love.graphics.newImage("assets/debugBlock.png")
block1 = love.graphics.newImage("assets/block1.png")
block2 = love.graphics.newImage("assets/block2.png")
block3 = love.graphics.newImage("assets/block3.png")
block4 = love.graphics.newImage("assets/block4.png")
block5 = love.graphics.newImage("assets/block5.png")
block6 = love.graphics.newImage("assets/block6.png")
block7 = love.graphics.newImage("assets/block7.png")
blockColors = { [0] = debugBlock, [1] = block1, [2] = block2, [3] = block3, [4] = block4, [5] = block5, [6] = block6, [7] = block7 }

secondsPassed = nil

pointForLine = 1
testingCoords = { }
shapeKey = 2
tetrominoSpawn = true
backgroundImg = nil
gridWidth = nil
gridHeight = nil
blockImg = nil
fallsCounter = 0
fastFallCooldown = nil
needRestoreShape = false
tetrominoes = { }
tetroSpawnTimer = 1
tetroFallTimer = .5
tempImg = nil


function love.load()
  gameOver = false
  tetrominoesFallen = 0
  fastFallCooldown = 0.1
  secondsPassed = 0
  shapeKey = 1
  nextShapeKey = 1
  canFall = true
  blockImg = love.graphics.newImage("assets/block.png")
  gridWidth = blockImg:getWidth() * 10
  gridHeight = blockImg:getHeight() * 22
  tetromino = { img = love.graphics.newImage("assets/blocks.png"), x = 0, y = 0 }
  backgroundImg = love.graphics.newImage("assets/Bck.png")
end

function resetGame()
  tetrominoesFallen = 0
  restoreShape()
  landed = {
  [1] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [2] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [3] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [4] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [5] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [6] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [7] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [8] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [9] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [10] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [11] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [12] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [13] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [14] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [15] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [16] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [17] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [18] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [19] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [20] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [21] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [22] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [23] =  { [-1] = 1, [0] = 1, [1] = 1, [2] = 1, [3] = 1, [4] = 1, [5] = 1, [6] = 1, [7] = 1, [8] = 1, [9] = 1, [10] = 1, [11] = 1},
  [24] =  { [-1] = 1, [0] = 1, [1] = 7, [2] = 7, [3] = 7, [4] = 7, [5] = 7, [6] = 7, [7] = 7, [8] = 7, [9] = 7, [10] = 7, [11] = 7},
  [25] =  { [-1] = 1, [0] = 1, [1] = 7, [2] = 7, [3] = 7, [4] = 7, [5] = 7, [6] = 7, [7] = 7, [8] = 7, [9] = 7, [10] = 7, [11] = 7},
}

landedColors = {
  [1] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [2] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [3] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [4] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [5] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [6] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [7] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [8] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [9] =   { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [10] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [11] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [12] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [13] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [14] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [15] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [16] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [17] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [18] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [19] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [20] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [21] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [22] =  { [-1] = 1, [0] = 1, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0, [8] = 0, [9] = 0, [10] = 0, [11] = 1},
  [23] =  { [-1] = 1, [0] = 1, [1] = 1, [2] = 1, [3] = 1, [4] = 1, [5] = 1, [6] = 1, [7] = 1, [8] = 1, [9] = 1, [10] = 1, [11] = 1},
  [24] =  { [-1] = 1, [0] = 1, [1] = 7, [2] = 7, [3] = 7, [4] = 7, [5] = 7, [6] = 7, [7] = 7, [8] = 7, [9] = 7, [10] = 7, [11] = 7},
  [25] =  { [-1] = 1, [0] = 1, [1] = 7, [2] = 7, [3] = 7, [4] = 7, [5] = 7, [6] = 7, [7] = 7, [8] = 7, [9] = 7, [10] = 7, [11] = 7},
} 
end

function love.keypressed(key)
  if key == 'k' then
    if gameOver then
      resetGame()
      gameOver = false
    end
  end
  if key == 'left' then      
    if not leftCollide() then
      tetromino.topLeft.x = tetromino.topLeft.x - 1
      tetromino.potentialTopLeft.x = tetromino.potentialTopLeft.x - 1
    end
  end
  if key == 'right' and tetromino.topLeft.x < 10 then
    if not rightCollide() then
      tetromino.topLeft.x = tetromino.topLeft.x + 1
      tetromino.potentialTopLeft.x = tetromino.potentialTopLeft.x + 1
    end
  end
  if key == 'up' then
    --if shapeKey == 2 then
      iterate = findPlace(2, 1)
    --end
    if iterate then
      if tetromino.shape.form < 4 then
        tetromino.shape.form = tetromino.shape.form + 1
      else
        tetromino.shape.form = 1
      end
    end
  end
  if key == 'o' then
    deleteRow(22)
  end
  
end

function rowAllOnes(row)
  returner = true
  for i = 1, 10 do
    --row is a table
    if row[i] == 0 then
      returner = false
    end
  end
  return returner
end

function deleteRow(floor)
  for i = (floor - 1), 1, -1 do
    for k, v in ipairs(landed[i]) do
      landed[i + 1][k] = v
    end
    for k, v in ipairs(landedColors[i]) do
      landedColors[i + 1][k] = v
    end
  end
end

-- restore function

function restoreShape()
  oShape = { [1] = { [1] = 1, [2] = 1, [3] = 0, [4] = 0 }, 
             [2] = { [1] = 1, [2] = 1, [3] = 0, [4] = 0 }, 
             [3] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
             [4] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 } }

  iShape = { [1] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
             [2] = { [1] = 1, [2] = 1, [3] = 1, [4] = 1 }, 
             [3] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
             [4] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, }
           
  jShape = { [1] = { [1] = 1, [2] = 0, [3] = 0, [4] = 0 }, 
             [2] = { [1] = 1, [2] = 1, [3] = 1, [4] = 0 }, 
             [3] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
             [4] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 } }
           
  lShape = { [1] = { [1] = 0, [2] = 0, [3] = 1, [4] = 0 }, 
             [2] = { [1] = 1, [2] = 1, [3] = 1, [4] = 0 }, 
             [3] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
             [4] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 } }
           
  sShape = { [1] = { [1] = 0, [2] = 1, [3] = 1, [4] = 0 }, 
             [2] = { [1] = 1, [2] = 1, [3] = 0, [4] = 0 }, 
             [3] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
             [4] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 } }
           
  tShape = { [1] = { [1] = 0, [2] = 1, [3] = 0, [4] = 0 }, 
             [2] = { [1] = 1, [2] = 1, [3] = 1, [4] = 0 }, 
             [3] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
             [4] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 } }
           
  zShape = { [1] = { [1] = 1, [2] = 1, [3] = 0, [4] = 0 }, 
             [2] = { [1] = 0, [2] = 1, [3] = 1, [4] = 0 }, 
             [3] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
             [4] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 } }
           
  shapeTable = { [1] = oShape, [2] = iShape, [3] = jShape, [4] = lShape, [5] = sShape, [6] = tShape, [7] = zShape }
end

--function restoreiShape()
  --iShape = { [1] = { [1] = 0, [2] = 0, [3] = 1, [4] = 0 }, 
    --       [2] = { [1] = 0, [2] = 0, [3] = 1, [4] = 0 }, 
      --     [3] = { [1] = 0, [2] = 0, [3] = 1, [4] = 0 }, 
        --   [4] = { [1] = 0, [2] = 0, [3] = 1, [4] = 0 }, 
          -- form = 1 }
 -- shapeTable[2] = iShape
--end

--function restorejShape()
--jShape = { [1] = { [1] = 1, [2] = 0, [3] = 0, [4] = 0 }, 
--           [2] = { [1] = 1, [2] = 1, [3] = 1, [4] = 0 }, 
--           [3] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
--           [4] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 } }
--  shapeTable[3] = jShape
--end
  
function love.update(dt)
  if gameOver then
    return
  end
  
  if tetroFallTimer <= 0 then
    --iterate through landed array check for collisions using potentialTopLeft
    for i = 1, 4 do
      for j = 1, 4 do
        local pRow = tetromino.potentialTopLeft.y
        local pCol = tetromino.potentialTopLeft.x
        if landed[pRow + (i - 1)][pCol + (j - 1)] == 1 and tetromino.shape[i][j] == 1 then
        testingCoords = { }
        table.insert(testingCoords, pRow + (i - 1))
        table.insert(testingCoords, pCol + (j - 1))
          for i = 1, 4 do
            for j = 1, 4 do
              if tetromino.shape[i][j] == 1 then
                landed[tetromino.topLeft.y + (i - 1)][tetromino.topLeft.x + (j - 1)] = 1
                landedColors[tetromino.topLeft.y + (i - 1)][tetromino.topLeft.x + (j - 1)] = shapeKey
                tetrominoSpawn = true
                needRestoreShape = true
                --needRestoreIshape = true
                --needRestoreJshape = true
              end
            end
          end
        end
      end
    end
    
    
    tetromino.topLeft.y = tetromino.topLeft.y + 1
    tetromino.potentialTopLeft.y = tetromino.potentialTopLeft.y + 1
    tetroFallTimer = .5
  end
  
  tetroFallTimer = tetroFallTimer - dt
  tetroSpawnTimer = tetroSpawnTimer - dt
  
  if needRestoreShape then
    restoreShape()
    needRestoreShape = false
  end
  
  --if needRestoreIshape then
  --  restoreiShape()
  --  needRestoreIshape = false
  --end
  
  --if needRestoreJshape then
  --  restorejShape()
  --  needRestoreJshape = false
  --end
  
  
  if love.keyboard.isDown('down') and fastFallCooldown <= 0 then
    tetroFallTimer = 0
    fastFallCooldown = 0.05
  end
  fastFallCooldown = fastFallCooldown - dt
  
  
  for i = 22, 1, -1 do
    if (rowAllOnes(landed[i])) then
      deleteRow(i)
      i = i + 1
    end
  end
      
  
  if tetrominoSpawn then
    tetrominoesFallen = tetrominoesFallen + 1
    shapeKey = nextShapeKey
    math.randomseed(os.time())
    nextShapeKey = math.random(1, 7)
    tetromino = nil
    tetromino = { shape = shapeTable[shapeKey], shapeKey = shapeKey, topLeft = { x = 4, y = 1 }, potentialTopLeft = { x = 4, y = 2 } }
    tetromino.shape.form = 1
    tetrominoSpawn = false
    for i = 1, 4 do
      for j = 1, 4 do
        if (landed[i][(tetromino.topLeft.x - 1) + j] == 1) and (tetromino.shape[i][j] == 1) then
          --os.exit()
          gameOver = true
        end
      end
    end
    
  end
  
  secondsPassed = secondsPassed + dt
end

function love.draw()
  if gameOver then
    love.graphics.print("game over you lose score :  " .. tetrominoesFallen, 100, 100)
    love.graphics.print("play again 'k'  ", 113, 120)
    return
  end
  
  --font = love.graphics.newFont("assets/exo/Exo-Bold.otf", 15)
  love.graphics.setColor(255, 255, 255)
  bckgrnd = love.graphics.newImage("assets/cloudsky.jpg")
  love.graphics.draw(bckgrnd)
  love.graphics.setColor(255, 255, 255)
  --love.graphics.setFont(font, 14)
  love.graphics.print("score :  " .. tetrominoesFallen, 250, 22 * blockImg:getHeight())
  --love.graphics.print("HELLO   (row, col)" .. tetromino.topLeft.y .. ", " .. tetromino.topLeft.x, 250, 0)
  --love.graphics.print("HELLO p(row, col)" .. tetromino.potentialTopLeft.y .. ", " .. tetromino.potentialTopLeft.x, 250, 10)
  --love.graphics.print("HELLO SHAPE KEY IS " .. shapeKey, 250, 20)
  --love.graphics.print("HELLO tetromino.topLeft = row: " .. tetromino.topLeft.y .. " col: " .. tetromino.topLeft.x, 250, 30)
  --love.graphics.print("HELLO leftMostCol: " .. leftMostCol, 250, 40)

  for i = 1, 4 do
    for j = 1, 4 do
      if shapeTable[nextShapeKey][i][j] == 1 then
        drawingBlock = blockColors[nextShapeKey]
        love.graphics.draw(drawingBlock, 300 + (j * blockImg:getWidth()), 50 + (i * blockImg:getHeight()))
      end
    end
  end
  
  --for i = 1, 4 do
  --  for j = 1, 4 do
  --    if tetromino.shape[i][j] == 1 then
  --      love.graphics.draw(blockImg, 300 + (j * blockImg:getWidth()), 150 + (i * blockImg:getHeight()))
  --    end
  --  end
  --end
  
  for k, v in ipairs(testingCoords) do
    love.graphics.print("" .. v .. ", ", 250 + (k * 30), 40)
  end
  
  for i = 1, 8 do
    if not (tetroBlocks[i] == nil) then
      love.graphics.print("" .. tetroBlocks[i] .. " ", 300 + (i * 15), 300)
    end
  end
  
  if not (r1 == nil) then
  love.graphics.print("" .. r1 .. ", " .. c1 .. "   " .. r2 .. ", " .. c2 .. "  " .. r3 .. ", " .. c3 .. "   " .. r4 .. ", " .. c4, 
                        300, 400)
end
  
  for i = 1, 22 do
    for j = 1, 10 do
      if landed[i][j] == 1 then
        colorKey = landedColors[i][j]
        love.graphics.draw(blockColors[colorKey], j * blockImg:getWidth(), i * blockImg:getHeight())
      end
      love.graphics.print("" .. landed[i][j], j * blockImg:getWidth(), i * blockImg:getHeight())
      love.graphics.print("" .. j, j * blockImg:getWidth(), 0)
      love.graphics.print("" .. i, 0, i * blockImg:getHeight())
    end
  end
  
  for i = 1, 4 do
    if not (tetromino.shape == nil) then
      for k, v in ipairs(tetromino.shape[i]) do 
        if v == 1 then
          love.graphics.draw(blockColors[shapeKey], ((k - 1) + tetromino.topLeft.x) * blockImg:getWidth(), 
                    ((i - 1) + tetromino.topLeft.y) * blockImg:getHeight())
        end
      end
    end
  end
  
  -- set coords for box around tetromino
  local x1 = tetromino.topLeft.x * blockImg:getWidth()
  local y1 = tetromino.topLeft.y * blockImg:getWidth()
  local x2 = (tetromino.topLeft.x + 4) * blockImg:getWidth()
  local y2 = (tetromino.topLeft.y + 4) * blockImg:getWidth()
  love.graphics.setLineStyle('rough')
  love.graphics.setColor(0, 255, 0)
  -- draw tetromino using coords
  love.graphics.line(x1, y1, x2, y1)
  love.graphics.line(x1, y1, x1, y2)
  love.graphics.line(x1, y2, x2, y2)
  love.graphics.line(x2, y1, x2, y2)
end