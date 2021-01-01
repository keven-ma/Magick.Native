// Copyright 2013-2021 Dirk Lemstra <https://github.com/dlemstra/Magick.Native/>
//
// Licensed under the ImageMagick License (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
//
//   https://www.imagemagick.org/script/license.php
//
// Unless required by applicable law or agreed to in writing, software distributed under the
// License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
// either express or implied. See the License for the specific language governing permissions
// and limitations under the License.
#pragma once

MAGICK_NATIVE_EXPORT void PerceptualHash_DisposeList(ChannelPerceptualHash *);

MAGICK_NATIVE_EXPORT const ChannelPerceptualHash *PerceptualHash_GetInstance(const Image *, const ChannelPerceptualHash *, const size_t);
