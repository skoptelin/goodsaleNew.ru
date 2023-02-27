<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateAdRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules(){
        
        if (FormRequest::hasFile('picture')) {
            return [
                'title' => ['required', 'string', 'max:200'],
                'description' => ['required', 'string', 'max:1500'],
                'price' => ['required', 'numeric', 'integer', 'max_digits:20'],
                'city' => ['required', 'string', 'max:200'],
                'picture' => ['image', 'max:5000'],
            ];
        } else {
            return [
                'title' => ['required', 'string', 'max:200'],
                'description' => ['required', 'string', 'max:1500'],
                'price' => ['required', 'numeric', 'integer', 'max_digits:20'],
                'city' => ['required', 'string', 'max:200'],
            ];
        }
    }
}
