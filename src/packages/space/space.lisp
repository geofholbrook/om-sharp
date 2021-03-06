;============================================================================
; om#: visual programming language for computer-assisted music composition
; J. Bresson et al. (2013-2020)
; Based on OpenMusic (c) IRCAM - Music Representations Team
;============================================================================
;
;   This program is free software. For information on usage
;   and redistribution, see the "LICENSE" file in this distribution.
;
;   This program is distributed in the hope that it will be useful,
;   but WITHOUT ANY WARRANTY; without even the implied warranty of
;   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
;
;============================================================================
; File author: J. Bresson
;============================================================================

(in-package :om)

;(require-om-package "sound")

;;; OpenGL interface (from LispWorks)
(load (merge-pathnames "OpenGL/lw-opengl/load" *load-pathname*))

;;; Mid-level OM-OpenGL interface:
(compile&load (om-relative-path '("OpenGL") "gl-user"))
(compile&load (om-relative-path '("OpenGL") "om-opengl-view"))
(compile&load (om-relative-path '("OpenGL") "om-3d-object"))

;;; Require no OpenGL
(compile&load (om-relative-path '("3D") "3dc"))
(compile&load (om-relative-path '("3D") "3d-tools"))
(compile&load (om-relative-path '("3D") "3d-functions"))
(compile&load (om-relative-path '("utils") "3d-elements"))
(compile&load (om-relative-path '("utils") "osc-manager"))

;;; Require OpenGL interface
(compile&load (om-relative-path '("3D") "3d-model"))
(compile&load (om-relative-path '("3D") "3dc-editor"))


(omNG-make-package
 "3D"
 :container-pack (get-subpackage *om-package-tree* "Basic Tools")
 :classes '(3DC 3D-model)
 :functions '())

(omNG-make-package
 "Conversions"
 :container-pack (get-subpackage *om-package-tree* "Basic Tools")
 ::functions '(car->pol pol->car xy->ad ad->xy xyz->aed aed->xyz))
