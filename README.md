# ImageProcressingVisualSearch
Image Visual search for image procressing assignment at Surey University

This is a visual searches can runned using the cvpr_computerdescriptor.m file. The file is a skelton code which iterates through every image in the database(MSRCV2 dataset) and it will call the descriptor.
The descriptor is used to compute the images.

Then a visual search file (cvpr_visual search) is used to load all the descriptors that were pre computed from the cvpr_computedescriptor.m from the images in the database.
It will pick a descriptor at random and compare all other using the cvpr_compare.m. The cvpr_compare.m file is using a algorithm known as the Eucliedean distanc and Manahalobnis distance.
These algorithms look at the similarities between each of the images in the feature space(high dimension) and projects them into lower dimesions where a decision can be made.
From using the cvpr_compare file each image is ranked by its similarity.

The output is the top 10 result and prv curve for the query against the database.

