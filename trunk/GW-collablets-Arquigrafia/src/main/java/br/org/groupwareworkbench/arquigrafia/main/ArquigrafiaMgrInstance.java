/*
 *    UNIVERSIDADE DE SÃO PAULO.
 *    Author: Marco Aurélio Gerosa (gerosa@ime.usp.br)
 *    This project was/is sponsored by RNP and FAPESP.
 *
 *    This file is part of Groupware Workbench (http://www.groupwareworkbench.org.br).
 *
 *    Groupware Workbench is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU Lesser General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    Groupware Workbench is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU Lesser General Public License for more details.
 *
 *    You should have received a copy of the GNU Lesser General Public License
 *    along with Swift.  If not, see <http://www.gnu.org/licenses/>.
 */
package br.org.groupwareworkbench.arquigrafia.main;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import br.org.groupwareworkbench.collablet.coord.user.User;
import br.org.groupwareworkbench.core.framework.AbstractBusiness;
import br.org.groupwareworkbench.core.framework.Collablet;
import br.org.groupwareworkbench.core.framework.annotations.ComponentInfo;
import br.org.groupwareworkbench.core.framework.annotations.DefaultProperty;
import br.org.groupwareworkbench.core.framework.annotations.RequiredProperty;

@ComponentInfo(version = "0.1",
        configurationURL = "/{arquigrafiaInstance}/",
        retrieveURL = "/{arquigrafiaInstance}/",
        defaultProperties = {
            @DefaultProperty(name = "cropPrefix", defaultValue = "crop_"),
            @DefaultProperty(name = "thumbPrefix", defaultValue = "thumb_"),
            @DefaultProperty(name = "mostraPrefix", defaultValue = "mostra_")
        })
public class ArquigrafiaMgrInstance extends AbstractBusiness {
    public ArquigrafiaMgrInstance(Collablet collablet) {
        super(collablet);
    }
}