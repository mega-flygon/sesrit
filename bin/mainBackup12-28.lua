--((landed[(tetromino.topLeft.y - 1) + 3][(tetromino.topLeft.x - 1) + 4] == 1) or
--(landed[(tetromino.topLeft.y - 1) + 3][(tetromino.topLeft.x - 1) + 2] == 1) or
--(landed[(tetromino.topLeft.y - 1) + 3][(tetromino.topLeft.x - 1) + 1] == 1))

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

tetroBlocks = { [1] = nil, [2] = nil, [3] = nil, [4] = nil, [5] = nil, [6] = nil, [7] = nil, [8] = nil }
canFall = nil
leftMostCol = 20


function leftCollide()
  leftMostCol = 4
  for i = 1, 4 do
    for j = 3, 0, -1 do
      if tetromino.shape[i][j] == 1 then
        if j < leftMostCol then
          leftMostCol = j
        end
      end
    end
  end
  for i = 1, 4 do
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

function checkRotate(shapeKey, shapeForm)  -- NOTE: THIS IS SHIT
  if shapeKey == 1 then                    -- collisions in the desired rotation, move if possible, then
  end                                      -- return TRUE if tetro was shifted to allow, false if not
  if shapeKey == 2 then                    -- true should result in rotation (tetro has been shifted),
    if shapeForm == 1 then                 -- false means no rotation
      local block1 = (landed[(tetromino.topLeft.y - 1) + 3][(tetromino.topLeft.x - 1) + 4] == 1)
      local block3 = (landed[(tetromino.topLeft.y - 1) + 3][(tetromino.topLeft.x - 1) + 2] == 1)
      local block4 = (landed[(tetromino.topLeft.y - 1) + 3][(tetromino.topLeft.x - 1) + 1] == 1)
      if block4 then
        if block3 then
          if block1 then
            return false  -- this should PREVENT THE ROTATION
          end
          if (landed[(tetromino.topLeft.y -1) + 3][(tetromino.topLeft.x - 1) + 5] == 0) and
              (landed[(tetromino.topLeft.y -1) + 3][(tetromino.topLeft.x - 1) + 6] == 0) then
            tetromino.topLeft.x = tetromino.topLeft.x + 2
            tetromino.potentialTopLeft.x = tetromino.potentialTopLeft.x + 2
            return true -- SHOULD ALLOW ROTATION (now that tetro has been shifted to be legal
          end
        end
      end
    end
    --if shapeForm == 2 then
      --((landed[(tetromino.topLeft.y - 1) + 1][(tetromino.topLeft.x - 1) + 2] == 1) or
      --(landed[(tetromino.topLeft.y - 1) + 2][(tetromino.topLeft.x - 1) + 2] == 1) or
      --(landed[(tetromino.topLeft.y - 1) + 3][(tetromino.topLeft.x - 1) + 2] == 1) or
      --(landed[(tetromino.topLeft.y - 1) + 4][(tetromino.topLeft.x - 1) + 2] == 1))
    --end
  end
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
  
  iRotate(nextShape)
  
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
  while i <= 3 and (not foundSpot) do
    if (landed[r1][c1 + i]) == 0 and (landed[r2][c2 + i]) == 0 and (landed[r3][c3 + i]) == 0 and (landed[r4][c4 + i] == 0) then
      foundSpot = true
      tetromino.topLeft.x = tetromino.topLeft.x + i
      tetromino.potentialTopLeft.x = tetromino.potentialTopLeft.x + i
      iRotate(tetromino.shape)
      return true
    end
    if (landed[r1][c1 - i] == 0) and (landed[r2][c2 - i] == 0) and (landed[r3][c3 - i] == 0) and (landed[r4][c4 - i] == 0) then
      foundSpot = true
      tetromino.topLeft.x = tetromino.topLeft.x - i
      tetromino.potentialTopLeft.x = tetromino.potentialTopLeft.x - i
      iRotate(tetromino.shape)
      return true
    end
    if (landed[r1 - i][c1]) == 0 and (landed[r2 - i][c2]) == 0 and (landed[r3 - i][c3]) == 0 and (landed[r4 - i][c4] == 0) then
      foundSpot = true
      tetromino.topLeft.y = tetromino.topLeft.y - i
      tetromino.potentialTopLeft.y = tetromino.potentialTopLeft.y - i
      iRotate(tetromino.shape)
      return true
    end
    i = i + 1
    end
  return false
  --i = 0
  --if landed[row][c4 - 1] == 1 then
  --  i = 4
  --end
  --while i <= 3 and (not foundSpot) do
  --  if landed[row][c1 - i] == 0 and landed[row][c2 - i] == 0 and landed[row][c3 - i] == 0 and landed[row][c4 - i] == 0 then
  --    foundSpot = true
  --    tetromino.topLeft.x = tetromino.topLeft.x - i
  --    tetromino.potentialTopLeft.x = tetromino.potentialTopLeft.x - i
  --    iRotate(tetromino.shape)
  --    return
  --  end
  --  i = i + 1
  --end
  --i = 0
  --while i <= 3 and (not foundSpot) do
  --  if landed[row - i][c1] == 0 and landed[row - i][c2] == 0 and landed[row - i][c3] == 0 and landed[row - i][c4] == 0 then
  --    foundSpot = true
  --    tetromino.topLeft.y = tetromino.topLeft.y - i
  --    tetromino.potentialTopLeft.y = tetromino.potentialTopLeft.y - i
  --    iRotate(tetromino.shape)
  --    return
  --  end
  --  i = i + 1
  --end
  
end

function iRotate(shape)  
  
  if shape.form == 1 then
    shape[3][4] = 1
    shape[3][2] = 1
    shape[3][1] = 1
    shape[1][3] = 0
    shape[2][3] = 0
    shape[4][3] = 0
  end
  if shape.form == 2 then
    shape[3][1] = 0
    shape[3][3] = 0
    shape[3][4] = 0
    shape[1][2] = 1
    shape[2][2] = 1
    shape[4][2] = 1
  end
  if shape.form == 3 then
    shape[1][2] = 0
    shape[3][2] = 0
    shape[4][2] = 0
    shape[2][1] = 1
    shape[2][3] = 1
    shape[2][4] = 1
  end
  if shape.form == 4 then
    shape[2][1] = 0
    shape[2][2] = 0
    shape[2][4] = 0
    shape[1][3] = 1
    shape[3][3] = 1
    shape[4][3] = 1
  end
  return (not willCollide)
end

oShape = { [1] = { [1] = 1, [2] = 1, [3] = 0, [4] = 0 }, 
           [2] = { [1] = 1, [2] = 1, [3] = 0, [4] = 0 }, 
           [3] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
           [4] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 } }

iShape = { --[1] = {
          [1] = { [1] = 0, [2] = 0, [3] = 1, [4] = 0 }, 
          [2] = { [1] = 0, [2] = 0, [3] = 1, [4] = 0 }, 
          [3] = { [1] = 0, [2] = 0, [3] = 1, [4] = 0 }, 
          [4] = { [1] = 0, [2] = 0, [3] = 1, [4] = 0 }, 
          -- }, [2] = {
          --[1] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
          --[2] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
          --[3] = { [1] = 1, [2] = 1, [3] = 1, [4] = 1 }, 
          --[4] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
          -- }, [3] = {
          --[1] = { [1] = 0, [2] = 1, [3] = 0, [4] = 0 }, 
          --[2] = { [1] = 0, [2] = 1, [3] = 0, [4] = 0 }, 
          --[3] = { [1] = 0, [2] = 1, [3] = 0, [4] = 0 }, 
          --[4] = { [1] = 0, [2] = 1, [3] = 0, [4] = 0 },
          -- }, [4] = {
          --[1] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
          --[2] = { [1] = 1, [2] = 1, [3] = 1, [4] = 1 }, 
          --[3] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }, 
          --[4] = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 },
          -- }
           }
         
iMaster = iShape
         
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

secondsPassed = nil

testingCoords = { }
shapeKey = 2
tetrominoSpawn = true
backgroundImg = nil
gridWidth = nil
gridHeight = nil
blockImg = nil
fallsCounter = 0
fastFallCooldown = nil
needRestoreIshape = false
tetrominoes = { }
tetroSpawnTimer = 1
tetroFallTimer = .5
tempImg = nil


function love.load()
  fastFallCooldown = 0.1
  secondsPassed = 0
  shapeKey = 1
  canFall = true
  blockImg = love.graphics.newImage("assets/block.png")
  gridWidth = blockImg:getWidth() * 10
  gridHeight = blockImg:getHeight() * 22
  tetromino = { img = love.graphics.newImage("assets/blocks.png"), x = 0, y = 0 }
  backgroundImg = love.graphics.newImage("assets/Bck.png")
end


function love.keypressed(key)
  if key == 'left' then
    canMoveLeft = true
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
    for i = 1, 4 do
      if tetromino.shape[i][leftMostCol] == 1 then
        if landed[tetromino.topLeft.y + (i - 1)][(tetromino.topLeft.x + (leftMostCol - 1)) - 1] == 1 then
          canMoveLeft = false
        end
      end
    end
      
    if canMoveLeft then
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
    if shapeKey == 2 then
      iterate = findPlace(2, 1)
    end
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
  end
end

function restoreiShape()
  iShape = { [1] = { [1] = 0, [2] = 0, [3] = 1, [4] = 0 }, 
           [2] = { [1] = 0, [2] = 0, [3] = 1, [4] = 0 }, 
           [3] = { [1] = 0, [2] = 0, [3] = 1, [4] = 0 }, 
           [4] = { [1] = 0, [2] = 0, [3] = 1, [4] = 0 }, 
           form = 1 }
  shapeTable[2] = iShape
end
  
function love.update(dt)
  tetroFallTimer = tetroFallTimer - dt
  tetroSpawnTimer = tetroSpawnTimer - dt
  
  if needRestoreIshape then
    restoreiShape()
    needRestoreIshape = false
  end
  
  
  
  if love.keyboard.isDown('down') and fastFallCooldown <= 0 then
    tetroFallTimer = 0
    fastFallCooldown = 0.05
  end
  fastFallCooldown = fastFallCooldown - dt
  
  
  for i = 21, 1, -1 do
    if (rowAllOnes(landed[i])) then
      deleteRow(i)
      i = i + 1
    end
  end
      
  
  if tetrominoSpawn then
    shapeKey = 2  --math.random(1, 7)
    tetromino = nil
    tetromino = { shape = shapeTable[shapeKey], shapeKey = shapeKey, topLeft = { x = 4, y = 1 }, potentialTopLeft = { x = 4, y = 2 } }
    tetromino.shape.form = 1
    tetrominoSpawn = false
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
                tetrominoSpawn = true
                needRestoreIshape = true
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
  secondsPassed = secondsPassed + dt
end

function love.draw()
  local one = 1
  local two = one
  two = 3
  love.graphics.setColor(255, 255, 255)
  love.graphics.print("HELLO   (row, col)" .. tetromino.topLeft.y .. ", " .. tetromino.topLeft.x, 250, 0)
  love.graphics.print("HELLO p(row, col)" .. tetromino.potentialTopLeft.y .. ", " .. tetromino.potentialTopLeft.x, 250, 10)
  love.graphics.print("HELLO SHAPE KEY IS " .. shapeKey, 250, 20)
  love.graphics.print("HELLO tetromino.topLeft = row: " .. tetromino.topLeft.y .. " col: " .. tetromino.topLeft.x, 250, 30)
  love.graphics.print("HELLO leftMostCol: " .. leftMostCol, 250, 40)
  
  if not (nextShape == nil) then
  for i = 1, 4 do
    for j = 1, 4 do
      if nextShape[i][j] == 1 then
        love.graphics.draw(blockImg, 300 + (j * blockImg:getWidth()), 50 + (i * blockImg:getHeight()))
      end
    end
  end
  end
  
  for i = 1, 4 do
    for j = 1, 4 do
      if iMaster[i][j] == 1 then
        love.graphics.draw(blockImg, 300 + (j * blockImg:getWidth()), 150 + (i * blockImg:getHeight()))
      end
    end
  end
  
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
        love.graphics.draw(blockImg, j * blockImg:getWidth(), i * blockImg:getHeight())
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
          love.graphics.draw(blockImg, ((k - 1) + tetromino.topLeft.x) * blockImg:getWidth(), 
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