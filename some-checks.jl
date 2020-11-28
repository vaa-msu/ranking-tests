
is_skewsymm(M) = M' == -M

col_negs(R::Matrix) = [sum(R[:,j].<0) for j=1:size(R)[2]]
row_negs(R::Matrix) = [sum(R[i,:].<0) for i=1:size(R)[1]]
negs(M) = (row_negs(M),col_negs(M))

straight_cols(R) = all(sort(col_negs(R)).==Vector(0:size(R)[2]-1))
straight_rows(R) = all(sort(row_negs(R)).==Vector(0:size(R)[1]-1))
is_straight(R) = straight_cols(R) && straight_rows(R)

crossing_cols(R) = any(sort(col_negs(R)).>Vector(0:size(R)[2]-1))
crossing_rows(R) = any(sort(row_negs(R)).>Vector(0:size(R)[1]-1))
is_crossing(R) = crossing_cols(R) || crossing_rows(R)

sum_above_cols(R) = sum(sort(col_negs(R)).>Vector(0:size(R)[2]-1))
sum_above_rows(R) = sum(sort(row_negs(R)).>Vector(0:size(R)[1]-1))

function upper_sum(A::Matrix)
    S, (H,W) = 0, size(A)
    @assert W == H
    for i=1:H, j=i+1:W  S += A[i,j] end
    return S
end

is_min_reached(R,T) = upper_sum(R[T,T]) == sum(R[R.<0])
