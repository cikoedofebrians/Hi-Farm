<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('history_products', function (Blueprint $table) {
            $table->id();
            $table->string("name");
            $table->integer("price");
            $table->string("city");
            $table->foreignId("shop_id")->constrained()->cascadeOnDelete()->cascadeOnUpdate();
            $table->foreignId("picture_id")->cascadeOnDelete()->cascadeOnUpdate();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('history_barangs');
    }
};