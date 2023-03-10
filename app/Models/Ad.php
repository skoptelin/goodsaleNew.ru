<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Ad extends Model{
    use HasFactory;

    protected $fillable = [
        'title',
        'description',
        'price',
        'picture',
        'user_id',
        'status_id'
    ];


    public function user(): BelongsTo{
        return $this->belongsTo(User::class);
    }
}
